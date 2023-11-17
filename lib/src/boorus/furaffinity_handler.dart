import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

/// Need to workout how login stuff works it will only display sfw atm, tried copying cookies from browser and that didn't seem to work
class FurAffinityHandler extends BooruHandler {
  FurAffinityHandler(super.booru, super.limit);

  Map<String, String>? body;

  @override
  List parseListFromResponse(dynamic response) {
    final document = parse(response.data);
    final gallery = document.getElementById('gallery-browse') ?? document.getElementById('gallery-search-results');
    final links = gallery?.querySelectorAll('figure > b > u > a') ?? [];
    return links;
  }

  @override
  Future<Response<dynamic>> fetchSearch(Uri uri, {bool withCaptchaCheck = true, Map<String, dynamic>? queryParams}) async {
    if (body == null) {
      return super.fetchSearch(uri, withCaptchaCheck: withCaptchaCheck);
    }

    final String cookies = await getCookies() ?? '';
    final Map<String, String> headers = {
      ...getHeaders(),
      if (cookies.isNotEmpty) 'Cookie': cookies,
    };

    Logger.Inst().log('fetching: $uri with headers: $headers', className, 'Search', LogTypes.booruHandlerSearchURL);

    return DioNetwork.post(
      uri.toString(),
      headers: headers,
      queryParameters: queryParams,
      customInterceptor: withCaptchaCheck ? DioNetwork.captchaInterceptor : null,
      data: FormData.fromMap(body!),
    );
  }

  @override
  Future<BooruItem?> parseItemFromResponse(dynamic responseItem, int index) async {
    final imgItem = responseItem.querySelector('img');

    if (imgItem.attributes['src'] != null) {
      final String id = responseItem.attributes['href']!.replaceAll('/', '').replaceAll('view', '');
      final String thumbURL = "https:${imgItem.attributes["src"]!}";
      final Document? postPage = await getPostPage(id);

      if (postPage == null) {
        return null;
      }

      final image = postPage.getElementById('submissionImg');

      final String fileURL = "https:${image?.attributes["data-fullview-src"]}";
      final String sampleURL = "https:${image?.attributes["data-preview-src"]}";
      if (fileURL == 'https:') {
        return null;
      }

      final List<String> tags = postPage.querySelectorAll('span.tags > a').map((e) => e.innerHtml).toList();
      final BooruItem item = BooruItem(
        fileURL: fileURL,
        sampleURL: sampleURL == 'https:' ? fileURL : sampleURL,
        thumbnailURL: thumbURL,
        tagsList: tags,
        postURL: makePostURL(id),
        rating: postPage.querySelector('div.rating')?.firstChild?.text,
        description: postPage.querySelector('div.submission-description')?.innerHtml.replaceAll(RegExp('<.*?>'), ''),
      );

      return item;
    } else {
      return null;
    }
  }

  Future<Document?> getPostPage(String id) async {
    final String url = makePostURL(id);
    final response = await DioNetwork.get(url, headers: getHeaders());
    if (response.statusCode == 200) {
      return parse(response.data);
    }
    return null;
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/view/$id';
  }

  @override
  String makeURL(String tags) {
    if (tags.trim().isEmpty) {
      return '${booru.baseURL}/browse/$pageNum';
    }
    body = {
      'page': '$pageNum',
      'next_page': 'Next',
      'q': tags.replaceAll(' ', '+'),
      'order-by': 'relevancy',
      'order-direction': 'desc',
      'range': '5years',
      'range_from': '',
      'range_to': '',
      'rating-general': '1',
      'rating-mature': '1',
      'rating-adult': '1',
      'type-art': '1',
      'type-music': '1',
      'type-flash': '1',
      'type-story': '1',
      'type-photo': '1',
      'type-poetry': '1',
      'mode': 'extended',
    };
    return '${booru.baseURL}/search/';
  }
}

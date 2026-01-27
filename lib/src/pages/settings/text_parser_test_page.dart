import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/utils/text_parser/comment_parser.dart';
import 'package:lolisnatcher/src/widgets/common/parsed_text.dart';

class TextParserTestPage extends StatefulWidget {
  const TextParserTestPage({super.key});

  @override
  State<TextParserTestPage> createState() => _TextParserTestPageState();
}

class _TextParserTestPageState extends State<TextParserTestPage> {
  final TextEditingController _customTextController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Test samples for different parsing rules
  static const List<_TestSample> _testSamples = [
    // URLs
    _TestSample(
      category: 'URLs',
      samples: [
        _SampleItem(
          name: 'HTTPS URL',
          text: 'Check out https://example.com/path?query=1 for more info',
        ),
        _SampleItem(
          name: 'HTTP URL',
          text: 'Old link: http://oldsite.net/page.html',
        ),
        _SampleItem(
          name: 'WWW URL (no scheme)',
          text: 'Visit www.google.com for searching',
        ),
        _SampleItem(
          name: 'Multiple URLs',
          text: 'Links: https://first.com and www.second.org and http://third.net/path',
        ),
        _SampleItem(
          name: 'URL with special chars',
          text: 'Complex URL: https://example.com/path?a=1&b=2#section',
        ),
      ],
    ),

    // Tags
    _TestSample(
      category: 'Tags',
      samples: [
        _SampleItem(
          name: 'Underscore tags',
          text: 'Nice art with tag_name and another_tag_here',
        ),
        _SampleItem(
          name: 'Hashtags',
          text: 'Posted with #art #digital #fanart',
        ),
        _SampleItem(
          name: 'Mixed tags',
          text: 'Character: some_character_name #fanart original_work',
        ),
        _SampleItem(
          name: 'Long tag chain',
          text: '1girl solo long_hair blue_eyes white_dress standing',
        ),
      ],
    ),

    // Quotes
    _TestSample(
      category: 'Quotes',
      samples: [
        _SampleItem(
          name: 'BBCode quote',
          text: '[quote]This is a quoted message from someone[/quote]\nMy response here',
        ),
        _SampleItem(
          name: 'Quote with author',
          text: '[quote=UserName]Their original message[/quote]\nI agree!',
        ),
        _SampleItem(
          name: 'Greentext quote',
          text: '>implying this works\n>mfw it does\nRegular text after',
        ),
        _SampleItem(
          name: 'Nested quotes',
          text: '[quote]Outer quote [quote]Inner quote[/quote] back to outer[/quote]',
        ),
      ],
    ),

    // Spoilers
    _TestSample(
      category: 'Spoilers',
      samples: [
        _SampleItem(
          name: 'BBCode spoiler',
          text: 'The ending is [spoiler]the hero wins[/spoiler] amazing!',
        ),
        _SampleItem(
          name: 'Discord spoiler',
          text: 'The secret is ||hidden content here|| revealed!',
        ),
        _SampleItem(
          name: 'Multiple spoilers',
          text: 'Hint 1: [spoiler]first[/spoiler] Hint 2: ||second||',
        ),
      ],
    ),

    // Mentions & References
    _TestSample(
      category: 'Mentions & References',
      samples: [
        _SampleItem(
          name: '@mention',
          text: 'Hey @username check this out! Also @another_user',
        ),
        _SampleItem(
          name: 'Said attribution',
          text: 'JohnDoe said: I think this is great',
        ),
        _SampleItem(
          name: 'Post reference (arrow)',
          text: '>>12345 this is replying to that post',
        ),
        _SampleItem(
          name: 'Post reference (hash)',
          text: 'See post #67890 and comment #11111',
        ),
        _SampleItem(
          name: 'Multiple references',
          text: '>>111 >>222 >>333 all related posts',
        ),
      ],
    ),

    // BBCode Formatting
    _TestSample(
      category: 'BBCode Formatting',
      samples: [
        _SampleItem(
          name: 'Bold',
          text: 'This is [b]bold text[/b] in a sentence',
        ),
        _SampleItem(
          name: 'Italic',
          text: 'This is [i]italic text[/i] in a sentence',
        ),
        _SampleItem(
          name: 'Underline',
          text: 'This is [u]underlined text[/u] in a sentence',
        ),
        _SampleItem(
          name: 'Strikethrough',
          text: 'This is [s]strikethrough text[/s] in a sentence',
        ),
        _SampleItem(
          name: 'Code block',
          text: 'Run this: [code]console.log("hello")[/code]',
        ),
        _SampleItem(
          name: 'Combined formatting',
          text: '[b]Bold [i]and italic[/i][/b] and [u][s]underline strikethrough[/s][/u]',
        ),
      ],
    ),

    // HTML Formatting
    _TestSample(
      category: 'HTML Formatting',
      samples: [
        _SampleItem(
          name: 'Bold (<b>)',
          text: 'This is <b>bold text</b> in a sentence',
        ),
        _SampleItem(
          name: 'Strong (<strong>)',
          text: 'This is <strong>strong text</strong> in a sentence',
        ),
        _SampleItem(
          name: 'Italic (<i>)',
          text: 'This is <i>italic text</i> in a sentence',
        ),
        _SampleItem(
          name: 'Emphasis (<em>)',
          text: 'This is <em>emphasized text</em> in a sentence',
        ),
        _SampleItem(
          name: 'Underline (<u>)',
          text: 'This is <u>underlined text</u> in a sentence',
        ),
        _SampleItem(
          name: 'Strikethrough (<s>)',
          text: 'This is <s>strikethrough</s> and <strike>strike</strike> and <del>deleted</del>',
        ),
        _SampleItem(
          name: 'Code (<code>)',
          text: 'Run this: <code>console.log("hello")</code>',
        ),
        _SampleItem(
          name: 'Mixed BBCode and HTML',
          text: '[b]BBCode bold[/b] and <b>HTML bold</b> and <strong>strong</strong>',
        ),
      ],
    ),

    // Complex/Mixed
    _TestSample(
      category: 'Complex Mixed Content',
      samples: [
        _SampleItem(
          name: 'Typical booru comment',
          text:
              '[quote=ArtFan123]Great work on the shading![/quote]\n'
              'Thanks! I used some_technique for the lighting.\n'
              'Check my other work at https://myportfolio.com\n'
              '#digital_art #fanart',
        ),
        _SampleItem(
          name: 'Forum reply',
          text:
              '>>54321\n'
              'I disagree with your point. @moderator can you check this?\n'
              '[spoiler]The real answer is hidden here[/spoiler]\n'
              'More info: www.reference-site.org',
        ),
        _SampleItem(
          name: 'All features',
          text:
              '[quote=User]Original post[/quote]\n'
              '@User I [b]strongly[/b] agree! See >>12345\n'
              'Tags: cool_art #amazing\n'
              'Link: https://example.com\n'
              'Spoiler: [spoiler]secret[/spoiler] and ||another||\n'
              '[code]code_here()[/code]\n'
              '[i]italic[/i] [u]underline[/u] [s]strike[/s]',
        ),
      ],
    ),

    // Malformed/Overlapping Tags
    _TestSample(
      category: 'Malformed Tags',
      samples: [
        _SampleItem(
          name: 'Overlapping BBCode (i/u)',
          text: '[i][u]italic and underline[/i][/u]',
        ),
        _SampleItem(
          name: 'Overlapping BBCode (b/i/u)',
          text: '[b][i][u]bold italic underline[/b][/i][/u]',
        ),
        _SampleItem(
          name: 'Overlapping HTML',
          text: '<b><i>bold italic</b></i>',
        ),
        _SampleItem(
          name: 'Mixed BBCode/HTML overlap',
          text: '[b]<i>mixed bold italic[/b]</i>',
        ),
        _SampleItem(
          name: 'Uppercase tags',
          text: '[B]Bold[/B] and [I]Italic[/I] and [U]Underline[/U]',
        ),
        _SampleItem(
          name: 'Complex overlap',
          text: '[B]<i>[u]text[/B]</i>[/u] end',
        ),
        _SampleItem(
          name: 'Orphaned closing tags',
          text: 'text [/b] orphan [/i] tags',
        ),
        _SampleItem(
          name: 'Unclosed tags',
          text: '[b]bold [i]italic text without closing',
        ),
      ],
    ),

    // Edge cases
    _TestSample(
      category: 'Edge Cases',
      samples: [
        _SampleItem(
          name: 'Empty content',
          text: '',
        ),
        _SampleItem(
          name: 'Plain text only',
          text: 'Just some regular text without any special formatting or links.',
        ),
        _SampleItem(
          name: 'Special characters',
          text: 'Special chars: <>&"\' should display correctly',
        ),
        _SampleItem(
          name: 'Unclosed tags',
          text: '[b]Bold without closing and [i]italic too',
        ),
        _SampleItem(
          name: 'URL-like in text',
          text: 'Not a URL: example.com or test.org without www',
        ),
        _SampleItem(
          name: 'Numbers and underscores',
          text: 'test_123 and 123_test and _underscore_ and test__double',
        ),
        _SampleItem(
          name: 'Unicode/Emoji',
          text: 'Emoji test: 😀 🎨 ✨ with tag_name and https://emoji.com',
        ),
        _SampleItem(
          name: 'Very long URL',
          text: 'Long: https://example.com/very/long/path/to/some/resource?with=many&query=parameters&and=more#section',
        ),
      ],
    ),
  ];

  @override
  void dispose() {
    _customTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Parser Test'),
      ),
      body: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        children: [
          // Custom input section
          _buildSection(
            theme,
            title: 'Custom Input',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _customTextController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Enter custom text to test parsing...',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 12),
                if (_customTextController.text.isNotEmpty) ...[
                  const Text(
                    'Parsed Result:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildParsedCard(context, _customTextController.text),
                  const SizedBox(height: 8),
                  _buildSegmentsDebug(context, _customTextController.text),
                ],
              ],
            ),
          ),

          const Divider(height: 32),

          // Test samples
          for (final category in _testSamples) ...[
            _buildSection(
              theme,
              title: category.category,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final sample in category.samples) ...[
                    _buildSampleItem(context, sample),
                    const SizedBox(height: 12),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildSection(ThemeData theme, {required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }

  Widget _buildSampleItem(BuildContext context, _SampleItem sample) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    sample.name,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.bug_report, size: 20),
                  onPressed: () => _showDebugDialog(context, sample),
                  tooltip: 'Show parsed segments',
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            const Divider(),
            const Text(
              'Input:',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: SelectableText(
                sample.text.isEmpty ? '(empty)' : sample.text,
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                  color: sample.text.isEmpty ? Colors.grey : null,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Parsed:',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            _buildParsedCard(context, sample.text),
          ],
        ),
      ),
    );
  }

  Widget _buildParsedCard(BuildContext context, String text) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: text.isEmpty
          ? const Text(
              '(empty)',
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            )
          : ParsedText(
              text: text,
              style: const TextStyle(fontSize: 14),
              onUrlTap: (url) => _showTapFeedback(context, 'URL', url),
              onTagTap: (tag) => _showTapFeedback(context, 'Tag', tag),
              onMentionTap: (username) => _showTapFeedback(context, 'Mention', username),
              onPostReferenceTap: (postId) => _showTapFeedback(context, 'Post Ref', postId),
            ),
    );
  }

  Widget _buildSegmentsDebug(BuildContext context, String text) {
    final parser = CommentParser.instance;
    final segments = parser.parse(text);

    return ExpansionTile(
      title: Text('Parsed Segments (${segments.length})'),
      tilePadding: EdgeInsets.zero,
      children: [
        for (int i = 0; i < segments.length; i++)
          ListTile(
            dense: true,
            visualDensity: VisualDensity.compact,
            title: Text(
              '[$i] ${segments[i].type}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Text: "${segments[i].text}"',
                  style: const TextStyle(fontSize: 11),
                ),
                if (segments[i].metadata.isNotEmpty)
                  Text(
                    'Meta: ${segments[i].metadata}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  void _showDebugDialog(BuildContext context, _SampleItem sample) {
    final parser = CommentParser.instance;
    final segments = parser.parse(sample.text);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Debug: ${sample.name}'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text(
                'Parsed Segments:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              for (int i = 0; i < segments.length; i++)
                Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '[$i] Type: ${segments[i].type}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Text: "${segments[i].text}"'),
                        if (segments[i].metadata.isNotEmpty) Text('Metadata: ${segments[i].metadata}'),
                      ],
                    ),
                  ),
                ),
              if (segments.isEmpty)
                const Text(
                  'No segments parsed',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showTapFeedback(BuildContext context, String type, String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$type tapped: $value'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class _TestSample {
  const _TestSample({
    required this.category,
    required this.samples,
  });

  final String category;
  final List<_SampleItem> samples;
}

class _SampleItem {
  const _SampleItem({
    required this.name,
    required this.text,
  });

  final String name;
  final String text;
}

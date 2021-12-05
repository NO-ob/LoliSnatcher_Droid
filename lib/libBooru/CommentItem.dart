import 'dart:convert';

class CommentItem {
  String? id, title, content, authorID, authorName, avatarUrl, postID, createDate, createDateFormat;
  int? score;

  CommentItem({
    this.id,
    this.title,
    this.content,
    this.authorID,
    this.authorName,
    this.avatarUrl,
    this.score,
    this.postID,
    this.createDate,
    this.createDateFormat,
  });

  Map toJSON() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'authorID': authorID,
      'authorName': authorName,
      'avatarUrl': avatarUrl,
      'score': score,
      'postID': postID,
      'createDate': createDate,
      'createDateFormat': createDateFormat,
    };
  }

  static CommentItem fromJSON(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return CommentItem(
      id: json['id'] as String,
      title: json['title'] as String?,
      content: json['content'] as String?,
      authorID: json['authorID'] as String?,
      authorName: json['authorName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      score: json['score'] as int?,
      postID: json['postID'] as String?,
      createDate: json['createDate'] as String?,
      createDateFormat: json['createDateFormat'] as String?,
    );
  }
}

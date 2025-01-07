import 'dart:convert';

import 'package:equatable/equatable.dart';

class CommentItem extends Equatable {
  const CommentItem({
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

  final String? id, title, content, authorID, authorName, avatarUrl, postID, createDate, createDateFormat;
  final int? score;

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        authorID,
        authorName,
        avatarUrl,
        score,
        postID,
        createDate,
        createDateFormat,
      ];

  Map<String, dynamic> toJson() {
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
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return CommentItem.fromMap(json);
  }

  static CommentItem fromMap(Map<String, dynamic> json) {
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

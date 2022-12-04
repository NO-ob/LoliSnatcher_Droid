import 'dart:convert';

class NoteItem {
  String? id, postID, content;
  int posX, posY, width, height;

  NoteItem({
    this.id,
    required this.postID,
    required this.content,
    required this.posX,
    required this.posY,
    required this.width,
    required this.height,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'postID': postID,
      'content': content,
      'posX': posX,
      'posY': posY,
      'width': width,
      'height': height,
    };
  }

  static NoteItem fromJSON(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return NoteItem.fromMap(json);
  }

  static NoteItem fromMap(Map<String, dynamic> json) {
    return NoteItem(
      id: json['id'] as String,
      postID: json['postID'] as String,
      content: json['content'] as String,
      posX: json['posX'] as int,
      posY: json['posY'] as int,
      width: json['width'] as int,
      height: json['height'] as int,
    );
  }
}

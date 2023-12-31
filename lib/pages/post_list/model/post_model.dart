class PostModel {
  PostModel({this.userId, this.id, this.title, this.body});

  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json["userId"] as int?,
      id: json["id"] as int?,
      title: json["title"] as String?,
      body: json["body"] as String?,
    );
  }
}

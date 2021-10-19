class Comment {
  final String username;
  final String text;

  Comment({
    required this.username,
    required this.text,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        username: json['username'] as String,
        text: json['text'] as String,
      );

  Map toJson() => {
        'username': username,
        'text': text,
      };
}

class CommentModel {
  int postId;
  int id;
  String name;
  String email;
  String body;

  CommentModel({this.postId, this.id, this.name, this.email, this.body});

  CommentModel.fromMap(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': this.id,
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'body': this.body
    };
  }
}

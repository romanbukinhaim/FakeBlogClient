import 'dart:convert';
import 'package:FakeBlogClient/models/CommentModel.dart';
import 'package:FakeBlogClient/models/PostModel.dart';
import 'package:FakeBlogClient/repository/DBProvider.dart';
import "package:http/http.dart" as http;

class BlogRepository {
  
  BlogRepository({this.BASE_URL});

  final String BASE_URL;
  
  Future<List<PostModel>> getPostList() async {
    var raw_data;
    try
    {
      raw_data = jsonDecode((await http.get("$BASE_URL/posts")).body);
    }
    catch(ex)
    {
      raw_data = await DBProvider.db.getAllPosts();
    }

    List<PostModel> res = List<PostModel>();
    raw_data.forEach((json) {
      res.add(PostModel.fromMap(json));
      DBProvider.db.insertPost(json);
     });
    return res;
  }

  Future<List<CommentModel>> getPostCommetList(int post_id) async {
    var raw_data;
    try
    {
      raw_data = jsonDecode((await http.get("$BASE_URL/posts/$post_id/comments")).body);
    }
    catch(ex)
    {
      raw_data = await DBProvider.db.getAllPostComments(post_id);
    }

    List<CommentModel> res = List<CommentModel>();
    raw_data.forEach((json) {
      res.add(CommentModel.fromMap(json));
      DBProvider.db.insertComment(json);
     });
    return res;
  }
}
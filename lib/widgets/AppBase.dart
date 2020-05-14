import 'dart:async';

import 'package:FakeBlogClient/models/CommentModel.dart';
import 'package:FakeBlogClient/models/PostModel.dart';
import 'package:FakeBlogClient/repository/BlogRepository.dart';
import 'package:flutter/widgets.dart';

class AppBase extends InheritedWidget {
  final BlogRepository blogRepository;

  AppBase({Key key, @required this.blogRepository, @required Widget child})
      : super(key: key, child: child);

  static AppBase of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppBase>();
  }

  @override
  bool updateShouldNotify(AppBase old) => false;

  Future<List<PostModel>> loadPostList() async {
    return blogRepository.getPostList();
  }

  Future<List<CommentModel>> loadComments(int post_id) async {
    return blogRepository.getPostCommetList(post_id);
  }
}

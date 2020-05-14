import 'package:FakeBlogClient/repository/BlogRepository.dart';
import 'package:FakeBlogClient/screens/PostListScreen.dart';
import 'package:FakeBlogClient/utils/constant.dart';
import 'package:FakeBlogClient/widgets/AppBase.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppBase(
      blogRepository: BlogRepository(BASE_URL: HOST),
      child: FakeBlogClient()));
}

class FakeBlogClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FakeBlogClient',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: PostListScreen(),
    );
  }
}

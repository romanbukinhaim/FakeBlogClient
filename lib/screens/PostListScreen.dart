import 'package:FakeBlogClient/models/PostModel.dart';
import 'package:FakeBlogClient/widgets/AppBase.dart';
import 'package:FakeBlogClient/widgets/NothingToShowWidget.dart';
import 'package:FakeBlogClient/widgets/PleaseWaitWidget.dart';
import 'package:flutter/material.dart';

import 'PostDetailScreen.dart';

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: Icon(Icons.home), title: Text("All Posts")),
        body: Center(
            child: StreamBuilder<List<PostModel>>(
          stream: AppBase.of(context).loadPostList().asStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return PleaseWaitWidget();
            else if (snapshot.data.isEmpty)
              return NothingToShowWidget();
            else
              return ListView.separated(
                  padding: EdgeInsets.all(8.0),
                  itemCount: snapshot.data.length,
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.black38,
                      ),
                  itemBuilder: (context, i) => ListTile(
                        title: Text(
                          snapshot.data[i].title,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          snapshot.data[i].body,
                          maxLines: 2,
                        ),
                        trailing: Text(
                            "userId#${snapshot.data[i].id}"), //по-хорошему нужно писать логин юзера или аватарку
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    PostDetailScreen(post: snapshot.data[i]))),
                      ));
          },
        )));
  }
}

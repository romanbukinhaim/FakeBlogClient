import 'package:FakeBlogClient/models/CommentModel.dart';
import 'package:FakeBlogClient/models/PostModel.dart';
import 'package:FakeBlogClient/widgets/AppBase.dart';
import 'package:FakeBlogClient/widgets/NothingToShowWidget.dart';
import 'package:FakeBlogClient/widgets/PleaseWaitWidget.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  final PostModel post;

  PostDetailScreen({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton()),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(post.title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
              Text(post.body, style: TextStyle(fontSize: 18))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(height: 4, color: Colors.deepPurple),
          Text("Comments:"),
          StreamBuilder<List<CommentModel>>(
              stream: AppBase.of(context).loadComments(post.id).asStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return PleaseWaitWidget();
                else if (snapshot.data.isEmpty)
                  return NothingToShowWidget();
                else
                  return Column(
                    children: snapshot.data
                        .map((f) => Column(
                          children: <Widget>[
                            ListTile(
                                  title: Column(
                                    children: <Widget>[
                                      Container(
                                          width: double.infinity,
                                          child: Text(
                                            f.name,
                                            textAlign: TextAlign.end,
                                          )),
                                      Container(
                                          width: double.infinity,
                                          child: Text(f.email, textAlign: TextAlign.end, style: TextStyle(fontSize: 12, color: Colors.black38, decoration: TextDecoration.underline),))
                                    ],
                                  ),
                                  subtitle: Text(f.body),
                                ),
                                Divider(height: 2),
                                SizedBox(height: 10)
                          ],
                        ))
                        .toList(),
                  );
              })
        ],
      ),
    );
  }
}

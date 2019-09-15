import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/blocs/github.bloc.dart';
import 'package:flutter_github/models/github.model.dart';

import 'detail.page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GithubBloc bloc = GithubBloc();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                hintText: 'Search one repository',
                hasFloatingPlaceholder: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            onChanged: (text) {
              bloc.searchInput.add(text);
            },
          ),
          SizedBox(height: 20),
          Expanded(
            child: StreamBuilder(
              stream: bloc.githubData,
              builder: (BuildContext context, AsyncSnapshot<GithubModel> snapshot) {
                return snapshot.data == null
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: snapshot.data?.items?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          var item = snapshot.data.items[index];
                          return Column(
                            children: <Widget>[
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(item.owner.avatarUrl),
                                ),
                                title: Text(item.fullName),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text('Starts: ${item.stargazersCount}'),
                                    SizedBox(width: 5),
                                    Icon(Icons.star, color: Colors.yellow)
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return DetailPage(item: item);
                                    }),
                                  );
                                },
                              ),
                              Divider()
                            ],
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

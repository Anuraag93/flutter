import 'package:flutter/material.dart';
import 'package:hacker_news/src/article.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _ids = [];//[ 18409883, 18410980, 18409514, 18410597, 18410628, 18404181, 18411935, 18403869, 18412398,];

  void _getArticleIdList() async {
    final url = "https://hacker-news.firebaseio.com/v0/beststories.json";
    final jsonStr = await http.get(url);
    if(jsonStr.statusCode == 200){
      setState(() {
        _ids = parseTopStories(jsonStr.body.toString());
      });
    }

  }

  Future<Article> _getArticleById(int id) async {
    final url = "https://hacker-news.firebaseio.com/v0/item/$id.json";

    final jsonString = await http.get(url);
    if(jsonString.statusCode == 200){
      return parseArticle(jsonString.body.toString());
    }
    return null;
  }
  @override
  void initState() {
    _getArticleIdList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            if (_ids.isNotEmpty) _ids.removeAt(0);
          });
        },
        child: ListView(
          children: _ids.map((i) => FutureBuilder<Article>(
            future: _getArticleById(i),
            builder: (BuildContext context, AsyncSnapshot<Article> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return _buildItem(snapshot.data);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )).toList(),
        ),
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      key: Key(article.title),
      padding: EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
          article.title,
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("${article.score.toString()} Comments"),
              IconButton(
                  icon: Icon(Icons.launch),
                  onPressed: () async {
                    if (await canLaunch(article.url)) {
                      await launch(article.url);
                    } else {
                      throw "Could not launch ${article.url}";
                    }
                  }),
            ],
          )
        ],
      ),
    );
  }
}

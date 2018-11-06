import 'package:flutter/material.dart';
import 'package:hacker_news/json_parsing.dart';
//import 'package:hacker_news/src/article.dart';
import 'package:url_launcher/url_launcher.dart';

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
  List<Article> _article = List<Article>();

  Article getArticleById(int id) {

    String jsonString =
        '{"by":"dhouston","descendants":71,"id":8863,"kids":[9224,8952,8917,8884,8887,8869,8940,8908,8958,9005,8873,9671,9067,9055,8865,8881,8872,8955,10403,8903,8928,9125,8998,8901,8902,8907,8894,8870,8878,8980,8934,8943,8876],"score":104,"time":1175714200,"title":"$id : My YC app: Dropbox - Throw away your USB drive","type":"story","url":"http://www.getdropbox.com/u/2/screencast.html"}';

    return parseArticle(jsonString);
  }

  @override
  void initState() {
    super.initState();
    for (var v = 0; v < 10; v++) {
      _article.add(getArticleById(v + 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          print('Refresheedd !!!!  _article.isNotEmpty :::: ${_article.isNotEmpty}');
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            if(_article.isNotEmpty) _article.removeAt(0);
          });
        },
        child: ListView(
          children: _article.map(_buildItem).toList(),
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

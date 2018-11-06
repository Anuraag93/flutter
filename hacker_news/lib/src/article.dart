class Article {
  final String by;
  final int descendants;
  final int id;
  final List<int> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  final String url;

  const Article({this.by, this.descendants, this.id, this.kids, this.score, this.time, this.title, this.type, this.url});

  factory Article.fromJson(Map<String, dynamic> json){
    if(json == null) return null;

    return Article(
      title: json['title'] ?? '[null',
      by: json['by'],
      url: json['url'],
      time: json['time'],
      score: json['score'],
      id: json['id']
    );
  }


}


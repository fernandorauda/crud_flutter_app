class ComicRequest {
  String comic;
  String author;
  String url;
  String description;
  String rewards;

  ComicRequest(
      {this.comic, this.author, this.url, this.description, this.rewards});

  ComicRequest.fromJson(Map<String, dynamic> json) {
    comic = json['comic'];
    author = json['author'];
    url = json['url'];
    description = json['description'];
    rewards = json['rewards'];
  }

  Map toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comic'] = this.comic;
    data['author'] = this.author;
    data['url'] = this.url;
    data['description'] = this.description;
    data['rewards'] = this.rewards;
    return data;
  }
}

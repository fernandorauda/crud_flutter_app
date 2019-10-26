class ComicResponse {
  String uuid;
  String comic;
  String author;
  String url;
  String description;
  int rewards;

  ComicResponse(
      {this.uuid,
      this.comic,
      this.author,
      this.url,
      this.description,
      this.rewards});

  ComicResponse.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    comic = json['comic'];
    author = json['author'];
    url = json['url'];
    description = json['description'];
    rewards = json['rewards'];
  }

  Map toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['comic'] = this.comic;
    data['author'] = this.author;
    data['url'] = this.url;
    data['description'] = this.description;
    data['rewards'] = this.rewards;
    return data;
  }
}

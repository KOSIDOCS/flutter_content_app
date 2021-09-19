class ContentModel {
  String? type;
  int? id;
  String? titile;
  String? content;
  String? imageUrl;

  ContentModel(
      {String? type,
      int? id,
      String? titile,
      String? content,
      String? imageUrl}) {
    this.type = type;
    this.id = id;
    this.titile = titile;
    this.content = content;
    this.imageUrl = imageUrl;
  }
}

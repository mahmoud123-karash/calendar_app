class BannerModel {
  String? id;
  String? uri;
  String? image;

  BannerModel({
    this.image,
    this.id,
    this.uri,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerModel &&
          runtimeType == other.runtimeType &&
          uri == other.uri &&
          id == other.id &&
          image == other.image;

  @override
  int get hashCode => uri.hashCode ^ image.hashCode ^ id.hashCode;

  BannerModel.fromjson(Map<String, dynamic> json) {
    uri = json['uri'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> tomap() {
    return ({
      'uri': uri,
      'image': image,
      'id': id,
    });
  }
}

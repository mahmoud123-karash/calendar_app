class EventModel {
  String? id;
  String? title;
  String? dateM;
  String? dateJ;
  String? image;
  String? description;
  String? dateO;

  EventModel(
      {this.image,
      this.id,
      this.title,
      this.dateJ,
      this.description,
      this.dateM,
      this.dateO});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          dateJ == other.dateJ &&
          dateM == other.dateM &&
          id == other.id &&
          dateO == other.dateO &&
          image == other.image;

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      image.hashCode ^
      dateM.hashCode ^
      dateO.hashCode ^
      id.hashCode ^
      dateJ.hashCode;

  EventModel.fromjson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    dateM = json['dateM'];
    description = json['description'];
    dateJ = json['dateJ'];
    dateO = json['dateO'];
    id = json['id'];
  }

  Map<String, dynamic> tomap() {
    return ({
      'title': title,
      'image': image,
      'dateJ': dateJ,
      'dateM': dateM,
      'description': description,
      'id': id,
      'dateO': dateO
    });
  }
}

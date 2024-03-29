import 'package:al_qamar/constants/api.dart';

class Category {
  final String? _collectionId;
  final String? _collectionName;
  final String? _id;
  final String? _name;
  final String? _image;
  final DateTime? _created;
  final DateTime? _updated;

  Category(
    this._collectionId,
    this._collectionName,
    this._id,
    this._name,
    this._image,
    this._created,
    this._updated,
  );

  factory Category.fromMapJson(Map<String, dynamic> jsonObject) {
    return Category(
      jsonObject['collectionId'],
      jsonObject['collectionName'],
      jsonObject['id'],
      jsonObject['name'],
      '${Api.baseUrl}/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['image']}',
      DateTime.parse(jsonObject['created']),
      DateTime.parse(jsonObject['updated']),
    );
  }

  String get collectionId => _collectionId ?? '';
  String get collectionName => _collectionName ?? '';
  String get id => _id ?? '';
  String get name => _name ?? '';
  String get image => _image ?? '';
  DateTime get created => _created ?? DateTime.now();
  DateTime get updated => _updated ?? DateTime.now();
}

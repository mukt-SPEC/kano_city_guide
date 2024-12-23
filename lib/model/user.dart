import 'package:kano_city_guide/model/coordinate.dart';

class User {
  String? id;
  String? name;

  List<int>? favouritePlaces;

  User({this.id, this.name, this.favouritePlaces});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'favouritePlaces': favouritePlaces,
    };
  }
}

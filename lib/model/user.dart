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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      favouritePlaces: List.from(json['favouritePlaces']),
    );
  }
}

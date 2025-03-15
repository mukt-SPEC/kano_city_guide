class User {
  String? id;
  String? name;
  String? email;

  List<int>? favouritePlaces;

  User({this.id, this.name,this.email, this.favouritePlaces});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'favouritePlaces': favouritePlaces,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      favouritePlaces: List.from(json['favouritePlaces']),
    );
  }
}

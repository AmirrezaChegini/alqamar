class User {
  final int _id;
  final dynamic _userID;
  final String _firstName;
  final String _lastName;
  final String? _bio;

  User(this._id, this._userID, this._firstName, this._lastName, this._bio);

  factory User.fromMapJson(Map<String, dynamic> jsonObject) {
    return User(
      jsonObject['id'],
      jsonObject['user_id'],
      jsonObject['first_name'],
      jsonObject['last_name'],
      jsonObject['bio'],
    );
  }

  int get id => _id;
  String get userID => _userID;
  dynamic get firstName => _firstName;
  String get lastName => _lastName;
  String get bio => _bio ?? '';
}

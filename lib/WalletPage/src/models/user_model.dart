class UserModel{
  String _name,_profilePic;
  int _points;

  UserModel(this._name, this._profilePic, this._points);

  String get name => _name;

  get profilePic => _profilePic;

  int get points => _points;

}
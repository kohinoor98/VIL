class CreditCardModel {
  final String _points, _date, _flag;
  CreditCardModel(this._points, this._date, this._flag);

  String get points => _points;

  String get flag => _flag;

  String get date => _date;
}

import 'package:flutter/material.dart';

class PaymentModel {
  IconData _icon;
  String _name, _date, _hour;
  Color _color;
  int _points;

  PaymentModel(this._icon, this._color, this._name, this._date, this._hour,
      this._points);

  String get name => _name;

  String get date => _date;

  String get hour => _hour;

  int get points => _points;

  IconData get icon => _icon;

  Color get color => _color;
}

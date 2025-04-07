import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  int? _billdays;
  int? _editedTF;
  int? _deletedTF;
  int? _ccTF;
  int? _dpltno;
  bool? _snfon;
  double? _cowSaleRate;
  double? _bufSaleRate;
  String _dairyname = '';
  DateTime? _depdate;
  String _address = '';
  String _mobile = '';
  String _applanguage = '';
  bool? _collectionPrint;
  bool? _milksalePrint;
  bool? _advancePrint;
  bool? _catlefeedPrint;
  bool? _fatFirst;
  bool _isSettingsLoaded = false;
  String _databasename = '';

  String get dairyname => _dairyname;
  int? get billdays => _billdays;
  bool? get snfon => _snfon;
  DateTime? get depdate => _depdate;
  String get address => _address;
  String get mobile => _mobile;
  String get applanguage => _applanguage;
  bool? get collectionPrint => _collectionPrint;
  bool? get milksalePrint => _milksalePrint;
  bool? get advancePrint => _advancePrint;
  bool? get catlefeedPrint => _catlefeedPrint;
  bool? get fatFirst => _fatFirst;
  bool? get isSettingsLoaded => _isSettingsLoaded;
  double? get cowSaleRate => _cowSaleRate;
  double? get bufSaleRate => _bufSaleRate;
  String get databasename => _databasename;

  int? get editedTF => _editedTF;
  int? get deletedTF => _deletedTF;
  int? get ccTF => _ccTF;
  int? get dpltno => _dpltno;
  void valuedpltno(int value) {
    _dpltno = value;
    notifyListeners();
  }

  void valueeditedTF(int value) {
    _editedTF = value;
    notifyListeners();
  }

  void valuedeletedTF(int value) {
    _deletedTF = value;
    notifyListeners();
  }

  void valueccTF(int value) {
    _ccTF = value;
    notifyListeners();
  }

  void valueDatabaseName(String value) {
    _databasename = value;
    notifyListeners();
  }

  void valuecowSaleRate(double value) {
    _cowSaleRate = value;
    notifyListeners();
  }

  void valuebufSaleRate(double value) {
    _bufSaleRate = value;
    notifyListeners();
  }

  void valueisSettingsLoaded(bool value) {
    _isSettingsLoaded = value;
    notifyListeners();
  }

  void valuefatFirst(bool value) {
    _fatFirst = value;
    notifyListeners();
  }

  void valuedairyName(String value) {
    _dairyname = value;
    notifyListeners();
  }

  void valuecatleFeedPrint(bool value) {
    _catlefeedPrint = value;
    notifyListeners();
  }

  void valueadvancePrint(bool value) {
    _advancePrint = value;
    notifyListeners();
  }

  void valuemilksalePrint(bool value) {
    _milksalePrint = value;
    notifyListeners();
  }

  void valuecollectionPring(bool value) {
    _collectionPrint = value;
    notifyListeners();
  }

  void valuemobile(String value) {
    _mobile = value;
    notifyListeners();
  }

  void valueaddress(String value) {
    _address = value;
    notifyListeners();
  }

  void valueapplanguage(String value) {
    _applanguage = value;
    notifyListeners();
  }

  void valuedepDate(DateTime value) {
    _depdate = value;
    notifyListeners();
  }

  void valuebilldays(int value) {
    _billdays = value;
    notifyListeners();
  }

  void valuesnfon(bool value) {
    _snfon = value;
    notifyListeners();
  }

  void resetFields() {
    _dpltno = null;
    _ccTF = null;
    _editedTF = null;
    _deletedTF = null;
    _billdays = null;
    _snfon = null;
    _dairyname = '';
    _depdate = null;
    _address = '';
    _mobile = '';
    _applanguage = '';
    _collectionPrint = null;
    _milksalePrint = null;
    _advancePrint = null;
    _catlefeedPrint = null;
    _fatFirst = null;
    _cowSaleRate = null;
    _bufSaleRate = null;
    _databasename = '';
    notifyListeners();
  }
}

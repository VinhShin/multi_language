library multi_language;

import 'package:flutter/material.dart';
import 'package:multi_language/langcode.dart';
import 'dart:ui' as ui;

import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';


abstract class LanguageAbstract {

  String _currentLang = LangCode.en.code;
  Map<String, Map<int, String>> _multilan;

  List<LangCode> _languages = List();

  String lang(int id) {
    return multilan[_currentLang][id];
  }

  clear(){
    if(_multilan != null){
      _multilan.clear();
    }
  }

  Map<String, Map<int, String>> get multilan {
    if (_multilan == null || _multilan.isEmpty) {
      _multilan = Map();
      List<LangCode> _languages = getLangDef();
      List<LangModel> _lang = getLangData();

      for (int i = _languages.length - 1; i >= 0; i--) {
        _multilan[_languages[i].code] = Map();

        for (int j = _lang.length - 1; j >= 0; j--) {
          if (_languages[i].code == LangCode.vn.code) {
            _multilan[LangCode.vn.code][_lang[j].key] = _lang[j].vn ?? _lang[j].def;
          } else if (_languages[i].code == LangCode.en.code) {
            _multilan[LangCode.en.code][_lang[j].key] = _lang[j].en ?? _lang[j].def;
          }
        }
      }
    }
    return _multilan;
  }

  List<LangModel> getLangData() {
    return List();
  }

  List<LangCode> getLangDef() {
    return [LangCode.en];
  }

  Future getLanguageLocal(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(Constants.SHARED_CURRENT_LANGUAGE)) {
      _currentLang = prefs.getString(Constants.SHARED_CURRENT_LANGUAGE);
    } else {
      _currentLang = ui.window.locale.languageCode;
    }
    if (!_languages.contains(_currentLang)) {
      _currentLang = _languages[0].toString();
    }
  }

  updateLanguageLocal(LangCode langCode) {
    _currentLang = langCode.toString();
    if (!_languages.contains(langCode)) {
      _currentLang = _languages[0].toString();
    }
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(Constants.SHARED_CURRENT_LANGUAGE, langCode.toString());
    });
  }
}

class LangModel {
  int key;

  String def;
  String vn;
  String en;

  LangModel(this.key, this.def, {this.vn, this.en});
}

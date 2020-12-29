import 'package:multi_language/langcode.dart';
import 'package:multi_language/language_abstract.dart';

String lang(int id) {
  var content = ManagerLang().lang(id);
  return content??"???";
}


extension IntExtend on int{
  trans(){
    return ManagerLang().lang(this);
  }
}

class ManagerLang extends LanguageAbstract{

  static ManagerLang _singeton = ManagerLang._internal();

  ManagerLang._internal();

  factory ManagerLang(){
    return _singeton;
  }

  @override
  List<LangCode> getLangDef() {
    // TODO: implement getLangDef
    return [LangCode.vn, LangCode.en];
  }

  @override
  List<LangModel> getLangData() {
    // TODO: implement getLangData
    return [
      LangModel(R.HELLO, "Xin chào", vn: "Xin chào", en: "Hello"),
      LangModel(2,"Sminapo", vn: "Sminapo", en: "Sminapo"),
      LangModel(3,"Sminapo", vn: "Sminapo", en: "Sminapo"),
    ];
  }
}

class R {
  static int HELLO = 1;
}

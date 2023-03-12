import 'dart:convert';

import '../../data/models/spell.dart';
import 'package:http/http.dart' as http;

class SpellProvider {
  Future<Map<String, dynamic>> getDataSpell() async {
    try {
      Uri url = Uri.parse('https://wizard-world-api.herokuapp.com/spells');
      var response = await http.get(url);

      if (response.statusCode != 200) {
        return {
          "error": true,
          "message": "${response.statusCode}",
        };
      }

      var bodyObjJson = jsonDecode(response.body) as List;
      List<Spell> spellObjs =
          bodyObjJson.map((spellJson) => Spell.fromJson(spellJson)).toList();
      var list = [];
      spellObjs.forEach((element) {
        list.add(element);
      });

      return {
        "error": false,
        "message": "Success get spell data",
        "data": list,
      };
    } catch (e) {
      return {
        "error": true,
        "message": "$e",
      };
    }
  }
}

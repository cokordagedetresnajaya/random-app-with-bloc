import 'dart:convert';

class Spell {
  String? id;
  String? name;
  String? incantation;
  String? effect;
  bool? canBeVerbal;
  String? type;
  String? light;
  String? creator;

  Spell({
    this.id,
    this.name,
    this.incantation,
    this.effect,
    this.canBeVerbal,
    this.type,
    this.light,
    this.creator,
  });

  Spell.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    incantation = json['incantation'];
    effect = json['effect'];
    canBeVerbal = json['canBeVerbal'];
    type = json['type'];
    light = json['light'];
    creator = json['creator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataJson = new Map<String, dynamic>();
    dataJson['id'] = this.id;
    dataJson['name'] = this.name;
    dataJson['incantation'] = this.incantation;
    dataJson['effect'] = this.effect;
    dataJson['canBeVerbal'] = this.canBeVerbal;
    dataJson['type'] = this.type;
    dataJson['light'] = this.light;
    dataJson['creator'] = this.creator;
    return dataJson;
  }
}

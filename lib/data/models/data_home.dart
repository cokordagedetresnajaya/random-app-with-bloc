class DataHome {
  String? fullname;
  String? profile;
  String? email;
  String? spell;
  String? spellEffect;
  String? spellType;

  DataHome(
      {this.fullname,
      this.profile,
      this.email,
      this.spell,
      this.spellEffect,
      this.spellType});

  DataHome.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    profile = json['profile'];
    email = json['email'];
    spell = json['spell'];
    spellEffect = json['spellEffect'];
    spellType = json['spellType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['profile'] = this.profile;
    data['email'] = this.email;
    data['spell'] = this.spell;
    data['spellEffect'] = this.spellEffect;
    data['spellType'] = this.spellType;
    return data;
  }
}

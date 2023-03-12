import 'dart:math';

import '../providers/user_provider.dart';
import '../providers/spell_provider.dart';
import '../models/user.dart';
import '../models/spell.dart';
import '../models/data_home.dart';

class RandomRepository {
  UserProvider userProvider = UserProvider();
  SpellProvider spellProvider = SpellProvider();

  Future<Map<String, dynamic>> getRandomData() async {
    Map<String, dynamic> userData = await userProvider.getDataUser();
    Map<String, dynamic> spellData = await spellProvider.getDataSpell();

    if (userData['error'] == true) {
      return userData;
    }

    if (spellData['error'] == true) {
      return spellData;
    }

    // Get Random User
    User user = userData['data'];

    DataUser dataRandomUser;
    if (user.data != null) {
      dataRandomUser = user.data!.randomUser();
    } else {
      dataRandomUser = DataUser();
    }

    // Get Random Spell
    List<dynamic> spells = spellData['data'];
    Spell dataRandomSpell;
    if (spells.isNotEmpty) {
      dataRandomSpell = spells.elementAt(Random().nextInt(spells.length - 1));
    } else {
      dataRandomSpell = Spell();
    }

    return {
      'error': false,
      'message': 'success fetch data',
      'data': DataHome(
        fullname: '${dataRandomUser.firstName} ${dataRandomUser.lastName}',
        email: '${dataRandomUser.email}',
        profile: '${dataRandomUser.avatar}',
        spell: '${dataRandomSpell.name}',
        spellEffect: '${dataRandomSpell.effect}',
        spellType: '${dataRandomSpell.type}',
      )
    };
  }
}

extension RandomUser on List<DataUser> {
  DataUser randomUser() {
    return elementAt(Random().nextInt(length - 1));
  }
}

import 'package:Crew_Coffee/modals/brew.dart';
import 'package:Crew_Coffee/modals/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Crew_Coffee/modals/brew.dart';

class Databaseservices {
//reference
  final String uid;
  Databaseservices({this.uid});
  final CollectionReference collectionReference =
      Firestore.instance.collection('coffee');
  Future updateUserdata(
    String sugars,
    String name,
    int strength,
  ) async {
    return await collectionReference
        .document(uid)
        .setData({'sugars': sugars, 'name': name, 'strength': strength});
  }

  //brew list from snapshot
  List<Brew> _brewlistfromsnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((e) {
      return Brew(
          name: e.data['name'] ?? '',
          strength: e.data['strength'] ?? 0,
          sugars: e.data['sugars'] ?? '0');
    }).toList();
  }

//userdata
  Userdata userdatafromsnapshot(DocumentSnapshot snapshot) {
    return Userdata(
        uid: uid,
        strength: snapshot.data['strength '],
        sugars: snapshot.data['sugars'],
        name: snapshot.data['name']);
  }

  //get data
  Stream<List<Brew>> get coffeedata {
    return collectionReference.snapshots().map(_brewlistfromsnapshot);
  }

  //get user doc
  Stream<Userdata> get userdata {
    return collectionReference
        .document(uid)
        .snapshots()
        .map(userdatafromsnapshot);
  }
}

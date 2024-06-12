import 'package:brewcrew/models/brew.dart';
import 'package:brewcrew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      print('Brew: ${doc.data()}');
      return Brew(
          name: doc['name'] ?? '',
          sugars: doc['sugars'] ?? '0',
          strength: doc['strength'] ?? 0);
    }).toList();
  }

  UserData _userDatafromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid, snapshot['name'], snapshot['sugars'], snapshot['strength']);
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDatafromSnapshot);
  }
}

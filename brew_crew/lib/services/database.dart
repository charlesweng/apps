import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final String? uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('maibrewcrew');

  // new document 
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set(<String, dynamic>{
      'sugars': sugars,
      'name': name,
      'strength': strength
    });
  }

  // brew list from a snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.get('name') ?? '',
        strength: doc.get('strength') ?? 0,
        sugars: doc.get('sugars') ?? '0'
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
            .map(_brewListFromSnapshot);
  }
  
  // userData from snapshot
  BrewCrewUserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return BrewCrewUserData(
      uid: uid,
      name: snapshot.get('name'),
      strength: snapshot.get('strength'),
      sugars: snapshot.get('sugars'),
    );
  }

  // get user doc stream
  Stream<BrewCrewUserData> get userData {
    return brewCollection
        .doc(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

class APIs{
 static  FirebaseAuth auth = FirebaseAuth.instance;
  static User get user => auth.currentUser!;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  
// For creating a new User
  static Future<void> createUser() async {
    final User = TurfUser(
      email: user.email.toString(),
      name: user.displayName.toString(),
      id: user.uid,

    );
    return await firestore.collection('users').doc(user.uid).set(User.toJson());
  }

  //for checking user exits or not..?
  static Future<bool> userExist() async {
    return (await firestore.collection('users').doc(user.uid).get()).exists;
  }


static Stream<List<Map<String, dynamic>>?> loadTurfsFromFirebase() {
  try {
    return FirebaseFirestore.instance.collection('turfs').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs
            .map((DocumentSnapshot document) => document.data() as Map<String, dynamic>)
            .toList();
      },
    );
  } catch (e) {
    log('Error loading turfs from Firestore: $e');
    return Stream.value(null);
  }
}

// Get user Data from firestore
  static Stream<DocumentSnapshot<Map<String, dynamic>>> getSelfInfo() {
    final turfUser = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .snapshots();
        log("$turfUser");
    return turfUser;
  }
 
}
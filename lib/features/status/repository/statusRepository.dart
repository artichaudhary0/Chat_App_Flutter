import 'dart:io';
import 'package:chat_app_flutter/widgets/contact_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final statusRepositoryProvider = Provider(
  (ref) => StatusRepository(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
    ref: ref,
  ),
);

class StatusRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final ProviderRef ref;

  StatusRepository({
    required this.firestore,
    required this.auth,
    required this.ref,
  });

  void uploadStatus({
    required String username,
    required String profilePicture,
    required String phoneNumber,
    required File statusImage,
    required BuildContext context,
  }) async {
    var statusId = const Uuid().v1();
    String uid = auth.currentUser!.uid;
    // String imageurl = await ref.read(commonFirebaseStorageRepositoryProvider).storeFileToFirebase("./status/$statusId$uid",statusImage);
    List<ContactsList> contact = [];
    if (await FlutterContacts.requestPremission()) {
      contact = await FlutterContacts.getContacts(withproperties: true);
    }

    List<String> uidWhoCanSee = [];

    for(int i = 0 ; i < contact.length; i++)
      {
        var userDataFirebase = await firestore.collection("users").where('phoneNumber',isEqualTo: contact[i].phones[0].number).replaceAll('',"")).get();






      }

  }
}

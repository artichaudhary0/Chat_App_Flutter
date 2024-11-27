import 'dart:io';
import 'package:chat_app_flutter/common/repositories/common_firebase_storage.dart';
import 'package:chat_app_flutter/common/utils/ultils.dart';
import 'package:chat_app_flutter/features/auth/screens/opt_screen.dart';
import 'package:chat_app_flutter/features/auth/screens/user_information_screen.dart';
import 'package:chat_app_flutter/models/user_model.dart';
import 'package:chat_app_flutter/screens/mobile_layout_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (_ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({required this.auth, required this.firestore});

  void signInWithPhoneNumber(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (error) {
          throw Exception(error.message);
        },
        codeSent: (String verificationId, int? resendToken) async {
          Navigator.pushNamed(context, OTPScreen.routeName,
              arguments: verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (error) {
      showSnackBar(context: context, content: error.message!);
    }
  }

  void verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String userOTP}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );

      await auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserInformationScreen.routeName,
        (route) => false,
      );
    } on FirebaseAuthException catch (error) {
      showSnackBar(context: context, content: error.message!);
    }
  }

  void saveUserDataIntoFirebase({
    required String name,
    required File? profilePicture,
    required ProviderRef ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid; // register user uid.
      String photoUrl =
          "https://static.vecteezy.com/system/resources/previews/005/129/844/non_2x/profile-user-icon-isolated-on-white-background-eps10-free-vector.jpg";
      if (profilePicture != null) {
        photoUrl =
            await ref.read(commonFirebaseStorageRepository).saveFileToFirebase(
                  "/profilePic$uid",
                  profilePicture,
                );
      }

      var user = UserModel(
        name: name,
        uid: uid,
        profilePic: photoUrl,
        isOnline: true,
        phoneNumber: auth.currentUser!.uid,
        groupId: [],
      );
      await firestore.collection("users").doc(uid).set(
            user.toMap(),
          );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MobileLayoutScreen(),
        ),
        (route) => false,
      );
    } on FirebaseAuthException catch (error) {
      showSnackBar(context: context, content: error.message!);
    }
  }

  Stream<UserModel> userData(String userId) {
    return firestore.collection("users").doc(userId).snapshots().map(
          (event) => UserModel.fromMap(
            event.data()!,
          ),
        );
  }

  void setUserDataState(bool isOnline) async {
    await firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .update({"isOnline": isOnline});
  }
}

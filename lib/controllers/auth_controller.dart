import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_list_app/views/home.dart';
import 'package:recipe_list_app/views/login.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  //email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = auth.currentUser as Rx<User?>;
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, (callback) => _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const Login());
    } else {
      Get.offAll(() => const Home());
    }
  }

  void register(email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar('About User', "User Message",
          backgroundColor: Colors.redAccent,
          titleText: const Text(
            'Account creation failed!',
            style: TextStyle(color: Colors.white),
          ),
          snackPosition: SnackPosition.BOTTOM,
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ));
    }
  }

  void login(email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('About Login', "Login Message",
          backgroundColor: Colors.redAccent,
          titleText: const Text(
            'Login failed!',
            style: TextStyle(color: Colors.white),
          ),
          snackPosition: SnackPosition.BOTTOM,
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ));
    }
  }

  void logOut() {
    auth.signOut();
  }

  Future addUserDetails(String name, phone, email, password, gender) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'gender': gender,
    });
  }
}

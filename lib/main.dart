import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_list_app/controllers/auth_controller.dart';
import 'package:recipe_list_app/themes/themes.dart';
import 'package:recipe_list_app/views/Main_screen.dart';
import 'package:recipe_list_app/views/login.dart';
import 'package:recipe_list_app/views/sign_up.dart';
import 'package:recipe_list_app/views/splash.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Food recipe",
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const Splash(),
        ),
        GetPage(
          name: '/login',
          page: () => const Login(),
        ),
        GetPage(
          name: '/signUp',
          page: () => const SignUp(),
        ),
        GetPage(
          name: '/mainScreen',
          page: () => const MainScreen(),
        ),
      ],
    );
  }

}

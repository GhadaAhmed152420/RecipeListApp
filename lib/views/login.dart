import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.multiply,
                  ),
                  image: const ExactAssetImage('assets/images/login.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: emailController,
                        validator: (String? input) {
                          if (input!.isNotEmpty) {
                            if (input.contains('@') && input.contains('.')) {
                              return null;
                            } else {
                              return 'Email is not valid!!';
                            }
                          } else {
                            return 'Enter some text!!';
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),
                            )
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: passwordController,
                        style: const TextStyle(color: Colors.white),
                        obscureText: true,
                        validator: (String? input) {
                          if (input!.isNotEmpty) {
                            if (input.length < 6) {
                              return 'password is very short!!';
                            }
                          } else {
                            return 'Enter password please!!';
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),
                            )
                        ),
                      ),
                      const SizedBox(
                        height: 60.0,
                      ),
                      MaterialButton(
                        color: Colors.black.withOpacity(0.8),
                        onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
                              Get.offAllNamed('/mainScreen');
                            }
                            },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account ? "),
                          TextButton(
                              onPressed: () {
                                Get.toNamed('/signUp');
                              },
                              child: const Text('Register Now'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

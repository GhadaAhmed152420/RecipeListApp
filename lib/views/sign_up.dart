import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_list_app/controllers/auth_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? gender;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
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
                    image: const ExactAssetImage('assets/images/signUp.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text(
                          "Let's get started!",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.name,
                        controller: nameController,
                        validator: (String? input) {
                          if (input!.isEmpty) {
                            return 'Enter your name';
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Name',
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
                        height: 30.0,
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        validator: (String? input) {
                          if (input!.isEmpty) {
                            return 'Enter your phone';
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Phone',
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
                        height: 30.0,
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
                        height: 30.0,
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
                        height: 30.0,
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        obscureText: true,
                        validator: (String? input) {
                          if (input!.isNotEmpty) {
                            if (input != passwordController.text) {
                              return 'Password is not match';
                            }
                          } else {
                            return 'Enter password again please!!';
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Confirm password',
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
                        height: 30.0,
                      ),
                      RadioListTile(
                        title: const Text("Male",style: TextStyle(color: Colors.white)),
                        value: "male",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                        activeColor: Colors.amber,
                      ),
                      RadioListTile(
                        title: const Text("Female",style: TextStyle(color: Colors.white),),
                        value: "female",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                        activeColor: Colors.amber,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      MaterialButton(
                        color: Colors.black.withOpacity(0.8),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
                            Get.offAllNamed('/mainScreen');
                            }
                          AuthController.instance.addUserDetails(nameController.text.trim(), phoneController.text.trim(), emailController.text.trim(), passwordController.text.trim(), gender);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

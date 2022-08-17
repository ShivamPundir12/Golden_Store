import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sizer/sizer.dart';

class MyLogin extends StatefulWidget {
  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _obscuretext = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  final formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      print('Ok');
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/shopping-cart-full-food-supermarket-aisle-elevated-view-high-internal-horizontal-composition-63616470.jpg"),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black45, BlendMode.darken))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Golden Store",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w400,
                        color: Colors.greenAccent.shade700,
                        fontFamily: 'Lobster'),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/front.png'),
                        alignment: Alignment.topCenter)),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.57,
                      right: 30,
                      left: 30),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                            cursorColor: Colors.grey.shade200,
                            controller: emailController,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black87),
                                    borderRadius: BorderRadius.circular(25)),
                                labelStyle: TextStyle(
                                    color: Colors.grey.shade200,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                hintText: "Enter Username",
                                labelText: "Username",
                                fillColor: Colors.white38,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                suffixIcon: Icon(
                                  CupertinoIcons.person_alt_circle_fill,
                                  color: Colors.grey.shade200,
                                )),
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'should not be Empty'),
                              EmailValidator(errorText: 'Enter a Valid Email')
                            ])),
                        SizedBox(height: 25),
                        TextFormField(
                            autocorrect: true,
                            cursorColor: Colors.grey.shade200,
                            controller: passwordController,
                            obscureText: _obscuretext,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black54),
                                    borderRadius: BorderRadius.circular(25)),
                                labelStyle: TextStyle(
                                    color: Colors.grey.shade100,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                hintText: "Enter Password",
                                labelText: "Password",
                                fillColor: Colors.white38,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _obscuretext = !_obscuretext;
                                  },
                                  child: Icon(
                                    _obscuretext
                                        ? CupertinoIcons.eye_fill
                                        : CupertinoIcons.eye_slash_fill,
                                    color: Colors.grey.shade200,
                                  ),
                                )
                                // IconButton(
                                //     onPressed: () {},
                                //     color: Colors.grey.shade200,
                                //     icon: Icon(CupertinoIcons.eye))
                                ),
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'should not be Empty'),
                              MinLengthValidator(6,
                                  errorText:
                                      'Password should be atleast 6 character long')
                            ])),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.03),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 100),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green.shade600,
                                onPrimary: Colors.white,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                minimumSize: Size(300, 50),
                              ),
                              onPressed: () async {
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim());
                                  Navigator.pushReplacementNamed(
                                      context, "/nav");
                                } on FirebaseAuthException catch (e) {
                                  Fluttertoast.showToast(
                                      msg: e.toString(),
                                      gravity: ToastGravity.BOTTOM);
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/register");
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(fontSize: 18),
                                ),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.greenAccent.shade700),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                            color:
                                                Colors.greenAccent.shade700)),
                                  ),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(fontSize: 18),
                                ),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.greenAccent.shade700),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                            color:
                                                Colors.greenAccent.shade700)),
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  // Future signUp() async {
  //   final emailController = TextEditingController();
  //   final passwordController = TextEditingController();
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailController.text.trim(),
  //         password: passwordController.text.trim());
  //   } on FirebaseAuthException catch (e) {
  //     Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
  //   }
  // }

  // final Authentication _authentication = Authentication();

  // Future login({required String email, required String password}) async {
  //   var response = _authentication.loginwithEmailAndPassword(
  //       email: email, password: password);
  //   if (response is FirebaseAuthException) {
  //     print("The error is $response");
  //   } else {
  //     print("The user data is $response");
  //   }
  // }

  // Future signIn() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );
  //   } on FirebaseAuthException {
  //     Fluttertoast.showToast(msg: "jfajdhfl", gravity: ToastGravity.CENTER);
  //   }
  //   ;
  //   return Navigator.of(context).pushReplacementNamed("/nav");
  // }
}

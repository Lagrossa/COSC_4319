import 'dart:ui';

import 'package:addvisor/Features/User_Auth/Presentation/Pages/signUp_screen.dart';
import 'package:addvisor/Features/User_Auth/Presentation/Widgets/form_container_widget.dart';
import 'package:addvisor/components/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:addvisor/Features/User_Auth/firebase_auth_imp/firebase_auth_service.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth =
      FirebaseAuthService(); //Authentication service
  final GlobalKey<FormState> _key = GlobalKey<FormState>(); //Validation key
  final TextEditingController _emailController =
      TextEditingController(); //Email auth
  final TextEditingController _passwordController =
      TextEditingController(); //Password auth
  String errorMess = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ThemeColors.background,
        title: const Text("Login"),
        elevation: 0,
      ),
      body: Form(
        key: _key,
        child: Stack(
          children: [
            SvgPicture.asset(
              //background
              'lib/assets/layered-waves-haikei.svg',
              semanticsLabel: 'Waves',
              fit: BoxFit.fill,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 24, 0, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'lib/assets/addvisor_logo2.png',
                            width: 170,
                            height: 60,
                            fit: BoxFit.fitHeight,
                            alignment: const Alignment(-1.00, 0.00),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                        child: SingleChildScrollView(
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text("Log In", //Title
                                      style: TextStyle(
                                        fontSize: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .fontSize,
                                        color: ThemeColors.white,
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .fontFamily,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .fontStyle,
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 12, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      "Log In Below", //Title
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0),
                                child: TextFormField(
                                  //Email Text/Auth/Validation
                                  controller: _emailController,
                                  validator: validateEmail,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: "Email Address",
                                    labelStyle: const TextStyle(
                                        color: ThemeColors.white),
                                    hintText: "Enter your email...",
                                    hintStyle: TextStyle(
                                      fontSize: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontSize,
                                      color: ThemeColors.white,
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontFamily,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xff7e6f7072),
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 24, 20, 24),
                                  ),
                                  style: const TextStyle(
                                    color: ThemeColors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0),
                                child: TextFormField(
                                  //Password Text/Auth/Validation
                                  controller: _passwordController,
                                  validator: validatePassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: const TextStyle(
                                        color: ThemeColors.white),
                                    hintText: "Enter your password...",
                                    hintStyle: TextStyle(
                                      fontSize: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontSize,
                                      color: ThemeColors.white,
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontFamily,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xff7e6f7072),
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 20),
                                  ),
                                  style: const TextStyle(
                                    color: ThemeColors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    errorMess,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 20),
                                    child: FFButtonWidget(
                                      //button to go to signup
                                      onPressed: () async {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignUpScreen()),
                                            (route) => false);
                                      },
                                      //context.pushNamed('forgotPassword');

                                      text: "Don't have an account?",
                                      options: FFButtonOptions(
                                        width: 170,
                                        height: 40,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 0),
                                        color: const Color(0x001A1F24),
                                        textStyle: TextStyle(
                                          fontSize: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .fontSize,
                                          color: ThemeColors.white,
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontFamily,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        elevation: 0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    //sign up button
                                    onPressed: () async {
                                      if (_key.currentState!.validate()) {
                                        try {
                                          _signIn();
                                          errorMess = '';
                                        } on FirebaseAuthException catch (error) {
                                          errorMess = error.message!;
                                        }
                                      }
                                    }
                                    ,
                                    text: "Log In",
                                    options: FFButtonOptions(
                                      width: 120,
                                      height: 50,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: ThemeColors.button,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                      elevation: 3,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ],
                              )
                            ])))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    //sign up function
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("User is successfully signed In");
      Navigator.pushNamed(context, "/home");
      AppNavBar.currentScreen = Screen.Home;
    } else {
      print("Error Occurred in SignUP");
    }
  }
}

String? validateEmail(String? InEmail) {
  //Email valid function
  if (InEmail == null || InEmail.isEmpty) return 'E-mail address required.';

  // RegExp regexpress = RegExp(r'\w+@\w+\.\w+');
  // if (!regexpress.hasMatch(InEmail)) return 'Invalid E-mail Address format.';

  return null;
}

String? validatePassword(String? InPassword) {
  //Password valid function
  if (InPassword == null || InPassword.isEmpty) return 'Password is required.';

  // RegExp regexpress =
  //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  // if (!regexpress.hasMatch(InPassword))
  //   return "Password must be at least 8 character which includes: an uppercase letter, number, and a special character.";

  return null;
}

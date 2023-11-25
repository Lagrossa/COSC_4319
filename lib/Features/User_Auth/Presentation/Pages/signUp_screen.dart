import 'package:addvisor/Features/User_Auth/Presentation/Pages/login_screen.dart';
import 'package:addvisor/Features/User_Auth/Presentation/Widgets/form_container_widget.dart';
import 'package:addvisor/Features/User_Auth/firebase_auth_imp/firebase_auth_service.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String errorMess = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: ThemeColors.background,
        title: const Text("Sign Up"),
        elevation: 0,
      ),
      body: Form(
        key: _key,
        child: Stack(
          children: [
            SvgPicture.asset(
              'lib/assets/layered-waves-haikei.svg',
              semanticsLabel: 'Waves',
              fit: BoxFit.fill,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(),
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
                                  Text("Sign Up",
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
                                      "Sign Up Below",
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: TextFormField(
                                  controller: _emailController,
                                  validator: validateEmail,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: "Email Address",
                                    labelStyle:
                                        TextStyle(color: ThemeColors.white),
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
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFF7E6F7072),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 24, 20, 24),
                                  ),
                                  style: TextStyle(
                                    color: ThemeColors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: TextFormField(
                                  controller: _passwordController,
                                  validator: validatePassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle:
                                        TextStyle(color: ThemeColors.white),
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
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFF7E6F7072),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 20),
                                  ),
                                  style: TextStyle(
                                    color: ThemeColors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    errorMess,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 20),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()),
                                            (route) => false);
                                      },
                                      //context.pushNamed('forgotPassword');

                                      text: "Already have an account?",
                                      options: FFButtonOptions(
                                        width: 170,
                                        height: 40,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                        color: Color(0x001A1F24),
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
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      if (_key.currentState!.validate()) {
                                        try {
                                          _signUp();
                                          errorMess = '';
                                        } on FirebaseAuthException catch (error) {
                                          errorMess = error.message!;
                                        }
                                      }
                                    }
                                    /*
              GoRouter.of(context).prepareAuthEvent();
              final user = await authManager.signInWithEmail(
                context,
                _model.emailAddressLoginController.text,
                _model.passwordLoginController.text,
              );
              if (user == null) {
                return;
              }
              context.goNamedAuth('MY_Card', context.mounted);*/
                                    ,
                                    text: "Sign Up",
                                    options: FFButtonOptions(
                                      width: 120,
                                      height: 50,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: ThemeColors.button,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                      elevation: 3,
                                      borderSide: BorderSide(
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

  void _signUp() async {
    //String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      if (kDebugMode) {
        print("User is successfully created");
      }
      Navigator.pushNamed(context, "/home");
    } else {
      if (kDebugMode) {
        print("Error Occurred in SignUP");
      }
    }
  }
}

String? validateEmail(String? InEmail) {
  if (InEmail == null || InEmail.isEmpty) return 'E-mail address required.';

  RegExp regexpress = RegExp(r'\w+@\w+\.\w+');
  if (!regexpress.hasMatch(InEmail)) return 'Invalid E-mail Address format.';

  return null;
}

String? validatePassword(String? InPassword) {
  if (InPassword == null || InPassword.isEmpty) return 'Password is required.';

  RegExp regexpress =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (!regexpress.hasMatch(InPassword))
    return "Password must be at least 8 character which includes: an uppercase letter, number, and a special character.";

  return null;
}

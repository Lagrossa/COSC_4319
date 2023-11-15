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
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: ThemeColors.background,
        title: const Text("Sign Up"),
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            'lib/assets/layered-waves-haikei.svg',
            semanticsLabel: 'Waves',
            fit: BoxFit.fill,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 1,
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
                          child:
                              Column(mainAxisSize: MainAxisSize.max, children: [
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
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Login Below",
                                style: FlutterFlowTheme.of(context).titleMedium,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: TextFormField(
                            controller: _emailController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Email Address",
                              labelStyle: TextStyle(color: ThemeColors.white),
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
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 24, 20, 24),
                            ),
                            style: TextStyle(
                              color: ThemeColors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: ThemeColors.white),
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
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 20, 20, 20),
                            ),
                            style: TextStyle(
                              color: ThemeColors.white,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                      (route) => false);
                                },
                                //context.pushNamed('forgotPassword');

                                text: "Already have an account?",
                                options: FFButtonOptions(
                                  width: 170,
                                  height: 40,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: Color(0x001A1F24),
                                  textStyle: TextStyle(
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
                              onPressed: _signUp
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
                              text: "Log In",
                              options: FFButtonOptions(
                                width: 120,
                                height: 50,
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: ThemeColors.button,
                                textStyle:
                                    FlutterFlowTheme.of(context).titleSmall,
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

      /*Center(
        child: 
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            FormContainerWidget(
              controller: _usernameController,
              hintText: "Username",
              isPasswordField: false,
            ),
            const SizedBox(
              height: 10,
            ),
            FormContainerWidget(
              controller: _emailController,
              hintText: "Email",
              isPasswordField: false,
            ),
            const SizedBox(
              height: 10,
            ),
            FormContainerWidget(
              controller: _passwordController,
              hintText: "Password",
              isPasswordField: true,
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: _signUp,
                child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text("Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))))),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  },
                  child: const Text("Log in",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                )
              ],
            )
          ]),
        ),
      ),*/
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

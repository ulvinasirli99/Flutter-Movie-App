import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_movie_app/controller/text_controller.dart';
import 'package:tmdb_movie_app/model/auth/auth_model.dart';
import 'package:tmdb_movie_app/routes/naviagtion_routes.dart';
import 'package:tmdb_movie_app/screen/auth/reset_pass.dart';
import 'package:tmdb_movie_app/screen/navigation/all_page_navigation.dart';
import 'package:tmdb_movie_app/service/auth/auth_service.dart';
import 'package:tmdb_movie_app/utils/validator.dart';
import 'package:tmdb_movie_app/widgets/clip/login_shape.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginPageFormKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  SharedPreferences preferences;
  AuthService authService;
  AuthModel authModel;
  String colorValueCheckUp = "";
  String userUID = "";
  String email = "";
  String pass = "";
  bool obscureText = true;
  bool callProgress = false;

  @override
  void initState() {
    super.initState();
    authModel = new AuthModel();
    authService = new AuthService();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int chekColorValue = 1;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white.withOpacity(1.0),
      body: Form(
        key: loginPageFormKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  ClipPath(
                    clipper: LoginShapeClipper(),
                    child: Container(
                      width: double.infinity,
                      color: Colors.blueAccent.withOpacity(0.7),
                      height: size.height * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              "Welcome \nBack",
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 4,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: callProgress,
                    child: Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      height: size.height * 0.6,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 15, left: 15),
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.always,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value) {
                                email = value;
                              },
                              controller: loginEmailController,
                              validator: (email) {
                                validateEmail(email);
                                colorValueCheckUp = email;
                                return validateEmail(email);
                              },
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.done,
                                  color: colorValueCheckUp == ""
                                      ? Colors.grey
                                      : Colors.green,
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  size: 18,
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15, left: 15),
                            child: TextFormField(
                              obscureText: obscureText,
                              onSaved: (value) {
                                pass = value;
                              },
                              validator: (password) {
                                return validatePasswordLength(password);
                              },
                              controller: loginPasswordController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    obscureText == true
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.remove_red_eye,
                                    color: Colors.grey.shade500,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () {
                                        if (obscureText == false) {
                                          obscureText = true;
                                        } else if (obscureText == true) {
                                          obscureText = false;
                                        }
                                      },
                                    );
                                  },
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 18,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ResetPassword(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Forgot Password ?",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue.shade500,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (loginPageFormKey.currentState.validate()) {
                                loginPageFormKey.currentState.save();
                                setState(() {
                                  callProgress = true;
                                });
                                preferences =
                                    await SharedPreferences.getInstance();
                                int a = preferences.getInt("userUIDCodeValue");
                                getUserById(a.toString());
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 50,
                                width: size.width,
                                child: Center(
                                  child: Text(
                                    "Log in",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Divider(
                                  height: 0.3,
                                  indent: 20,
                                  endIndent: 10,
                                  thickness: 1.0,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "or",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Flexible(
                                child: Divider(
                                  height: 0.3,
                                  indent: 10,
                                  endIndent: 20,
                                  thickness: 1.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, registerPage);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 50,
                                width: size.width,
                                child: Center(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<AuthModel> getUserById(String id) async {
    authModel = await authService.loginAuthentication(id);
    if (pass == authModel.phone && email == authModel.email) {
      Toast.show(
        "Login Succusfluy",
        context,
        duration: 3,
        textColor: Colors.white,
        backgroundColor: Colors.black,
      );
      print("Menim login olmagimi : ${authModel.email}");
    }
    setState(() {
      callProgress = false;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AllPagesNavigation(),
        ),
      );
    });
  }
}

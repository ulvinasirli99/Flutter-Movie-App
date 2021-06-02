import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_movie_app/controller/text_controller.dart';
import 'package:tmdb_movie_app/model/auth/auth_model.dart';
import 'package:tmdb_movie_app/routes/naviagtion_routes.dart';
import 'package:tmdb_movie_app/screen/navigation/all_page_navigation.dart';
import 'package:tmdb_movie_app/service/auth/auth_service.dart';
import 'package:tmdb_movie_app/utils/validator.dart';
import 'package:tmdb_movie_app/widgets/clip/register_shape.dart';
import 'package:toast/toast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> registerPageFormKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  SharedPreferences preferences;
  AuthService authService;
  AuthModel authModel;
  String name = "";
  String email = "";
  String pass = "";
  bool obscureText = true;
  bool callProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authModel = new AuthModel();
    authService = new AuthService();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldState,
      backgroundColor: Colors.white.withOpacity(1.0),
      body: Form(
        key: registerPageFormKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  ClipPath(
                    clipper: RegisterShapeClipper(),
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
                              "Create \nAccount",
                              style: TextStyle(
                                letterSpacing: 4,
                                fontSize: 20,
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
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    height: size.height * 0.7,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: TextFormField(
                            controller: registerNameController,
                            autovalidateMode: AutovalidateMode.always,
                            validator: (name) {
                              return validateName(name);
                            },
                            onSaved: (value) {
                              name = value;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                size: 18,
                              ),
                              hintText: "Name",
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
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: registerEmailController,
                            autovalidateMode: AutovalidateMode.always,
                            validator: (email) {
                              return validateEmail(email);
                            },
                            onSaved: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
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
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: TextFormField(
                            obscureText: obscureText,
                            controller: registerPassWordController,
                            autovalidateMode: AutovalidateMode.always,
                            validator: (pass) {
                              return validatePasswordLength(pass);
                            },
                            onSaved: (value) {
                              pass = value;
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obscureText == false
                                      ? Icons.remove_red_eye_rounded
                                      : Icons.remove_red_eye_outlined,
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
                        GestureDetector(
                          onTap: () async {
                            if (registerPageFormKey.currentState.validate()) {
                              registerPageFormKey.currentState.save();
                              preferences =
                                  await SharedPreferences.getInstance();
                              setState(() {
                                callProgress = true;
                              });
                              authModel =
                                  await authService.registerAuthentication(
                                name,
                                email,
                                pass,
                              );
                              preferences.setString("ad", name);
                              preferences.setString("posta", email);
                              preferences.setString("parol", pass);
                              Toast.show(
                                "Register Succusfluy",
                                context,
                                duration: 3,
                                textColor: Colors.white,
                                backgroundColor: Colors.black,
                              );
                              setState(() {
                                callProgress = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllPagesNavigation(),
                                ),
                              );
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
                                  "Sign up",
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
                            Navigator.pushNamed(context, loginPage);
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
                                  "Log in",
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
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

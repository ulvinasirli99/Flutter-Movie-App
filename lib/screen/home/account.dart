import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_movie_app/colors/app_color.dart';
import 'package:tmdb_movie_app/global/message/custom_toast.dart';
import 'package:tmdb_movie_app/mixins/logout_controller.dart';
import 'package:tmdb_movie_app/widgets/profile/custom_profile_widegt.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> with LogoutMix {
  SharedPreferences sharedPreferences;
  int uid = 0;
  String id = "";
  String email = "";
  String username = "";

  Future<void> userDetailFromMemeory() async {
    sharedPreferences = await SharedPreferences.getInstance();
    uid = sharedPreferences.getInt("userUIDCodeValue");
    id = uid.toString();
    email = sharedPreferences.getString("posta");
    username = sharedPreferences.getString("ad");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userDetailFromMemeory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomProfileWidget(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  logoutAccount(context);
                  CustomToast().customToast("Successfully performed.", context);
                },
                child: Icon(
                  Icons.logout,
                  size: 30,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "UID : ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.red.withOpacity(0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    id ?? "null",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Email : ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.red.withOpacity(0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    email ?? "null",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Name : ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.red.withOpacity(0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    username ?? "null",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Text(
                "Copyright All Rights Reserved",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }
}

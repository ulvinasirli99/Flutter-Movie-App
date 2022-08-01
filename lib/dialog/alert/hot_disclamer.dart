//Todo This is Hot page for 18+ movies

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_movie_app/screen/heat/heat_page.dart';

class Age18Disclamer extends StatelessWidget {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationCurve: Curves.easeIn,
      insetAnimationDuration: Duration(milliseconds: 1000),
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.7),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "Not recommended if you are under 18 years old.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange.shade300,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        animationDuration: Duration(milliseconds: 2000),
                        overlayColor: MaterialStateProperty.all(Colors.red),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.purple.shade300,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.clear,
                        size: 30,
                        color: Colors.red.shade300,
                      ),
                      label: Text("No"),
                    ),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        animationDuration: Duration(milliseconds: 2000),
                        overlayColor: MaterialStateProperty.all(Colors.green),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.indigo.shade300,
                        ),
                      ),
                      onPressed: () async {
                        prefs = await SharedPreferences.getInstance();
                        prefs.setBool("isVlaidDisclamer", true);
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HeatPage(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.verified,
                        size: 30,
                        color: Colors.green.shade400,
                      ),
                      label: Text("Yes"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_movie_app/model/auth/auth_model.dart';

SharedPreferences preferences;

class AuthService {
 
  //Todo Authentication Register
  Future<AuthModel> registerAuthentication(
 
      String name, String email, String pass) async {
 
    var url = "https://www.fluttermovie.top/api/Users";

    try {
 
      var autRequest = await http.post(
 
        Uri.parse(url),
 
        headers: {"Content-Type": "application/json"},
 
        body: jsonEncode(
 
          {
 
            "uid": randomUID.toString(),
 
            "userName": name,
 
            "email": email,
 
            "phone": pass
 
          },
 
        ),
 
      );

      var jsonDecoded = autRequest.body;

      if (autRequest.statusCode == 201) {
 
        print(autRequest.statusCode.toString());

        print(randomUID.toString());

        preferences = await SharedPreferences.getInstance();

        preferences.setInt("userUIDCodeValue", randomUID);

        return AuthModel.fromJson(jsonDecode(jsonDecoded));
 
      } else {
 
        print("Auth Error : " + autRequest.statusCode.toString());

        
      }
 
    } catch (e) {
 
      print(e.toString());
 
    }
 
  }

  //Todo Authentication Login
  Future<AuthModel> loginAuthentication(String id) async {
 
    String requrl = "https://www.fluttermovie.top/api/Users/${id}";

    try {
 
      var loginAuth = await http.get(
 
        Uri.parse(requrl),
 
        headers: {"Content-Type": "application/json"},
 
      );

      var jsonDecoded = loginAuth.body;

      if (loginAuth.statusCode == 200) {
 
        return AuthModel.fromJson(jsonDecode(jsonDecoded));
 
      } else {
 
        print("Login error : ${loginAuth.statusCode}");
 
      }
 
    } catch (e) {
     
      print(e.toString());
    
    }
 
  }

}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tmdb_movie_app/model/sms/otp_model.dart';

class OtpVerficationService {
  Future<OtpModel> forgotPasswordSendService() async {
    String otpUrl = "https://rest.nexmo.com/sms/json";

    try {
      var response = await http.post(
        Uri.parse(otpUrl),
         headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: jsonEncode(
          {
            "api_key": "84c761ba",
            "api_secret": "kECEmGsOFIP0nAQh",
            "from": "TMDB MOVIE",
            "to": "+994504197263",
            "text": "Salam Olsun Hamiya",
          },
        ),
      );

      var jsonEncoded = response.body;

      if (response.statusCode == 200) {
        return OtpModel.fromJson(jsonDecode(jsonEncoded));
      } else {
        print("Verfication error getdi : ${response.statusCode.toString()}");
      }
    } catch (e) {
      print("Error OTP getdi : ${e.toString()}");
    }
  }
}

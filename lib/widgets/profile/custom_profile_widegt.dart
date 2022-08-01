import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tmdb_movie_app/auth/profile_saver.dart';
import 'package:tmdb_movie_app/screen/favorite/my_films.dart';

class CustomProfileWidget extends StatefulWidget {
  @override
  _CustomProfileWidgetState createState() => _CustomProfileWidgetState();
}

class _CustomProfileWidgetState extends State<CustomProfileWidget> {
  late File? _image;
  final picker = ImagePicker();
  Image? image;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        image = Image.memory(
          _image!.readAsBytesSync(),
          width: 90,
          height: 90,
          fit: BoxFit.cover,
        );
      } else {
        Fluttertoast.showToast(
          msg: "No image selected",
          toastLength: Toast.LENGTH_LONG,
          textColor: Colors.teal,
          backgroundColor: Colors.black,
        );
      }
    });
  }

  Future imageSaveMemory() async {
    setState(() {
      var file = ProfileSaver.base64String(_image!.readAsBytesSync());
      ProfileSaver.saveImageToPrefs(file);
    });
  }

  Future imageLoadFromMemory() async {
    ProfileSaver.loadImageFromPrefs().then((value) {
      setState(() {
        image = ProfileSaver.imageFrom64BaseString(value!);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      imageLoadFromMemory();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.width / 3),
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 120,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoritePage(),
                    ),
                  );
                },
                child: Icon(
                  Icons.favorite,
                  size: 45,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              // ignore: unnecessary_null_comparison
              child: image == null
                  ? Image.asset(
                      'assets/loading.gif',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: image!.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: 90,
                      height: 90,
                    ),
            ),
          ),
          Positioned(
            top: 60,
            left: size.width / 1.94,
            child: IconButton(
              icon: Icon(
                Icons.flip_camera_ios,
                size: 35,
                color: Colors.red,
              ),
              onPressed: () async {
                await getImage();
                await imageSaveMemory();
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tmdb_movie_app/auth/auth_session.dart';
import 'package:tmdb_movie_app/provider/cSS_provider.dart';
import 'package:tmdb_movie_app/provider/cS_provider.dart';
import 'package:tmdb_movie_app/provider/mS_provider.dart';
import 'package:tmdb_movie_app/provider/rS_providerr.dart';
import 'package:tmdb_movie_app/routes/naviagtion_routes.dart';
import 'package:tmdb_movie_app/screen/auth/login.dart';
import 'package:tmdb_movie_app/screen/auth/register.dart';
import 'package:tmdb_movie_app/screen/home/popular.dart';
import 'package:tmdb_movie_app/screen/navigation/all_page_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<MServiceProvider>(
    create: (_) => MServiceProvider(),
  ),
  ChangeNotifierProvider<CServiceProvider>(
    create: (_) => CServiceProvider(),
  ),
  ChangeNotifierProvider<RServiceProvider>(
    create: (_) => RServiceProvider(),
  ),
  ChangeNotifierProvider<CastServiceProvider>(
    create: (_) => CastServiceProvider(),
  ),
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        loginPage: (context) => LoginPage(),
        registerPage: (context) => RegisterPage(),
      },
      home: AllPagesNavigation(),
    );
  }
}

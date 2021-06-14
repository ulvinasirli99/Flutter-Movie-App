import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tmdb_movie_app/provider/movie/cSS_provider.dart';
import 'package:tmdb_movie_app/provider/movie/cS_provider.dart';
import 'package:tmdb_movie_app/provider/movie/mS_provider.dart';
import 'package:tmdb_movie_app/provider/movie/rS_providerr.dart';
import 'package:tmdb_movie_app/provider/storage/check_stoarge.dart';
import 'package:tmdb_movie_app/routes/naviagtion_routes.dart';
import 'package:tmdb_movie_app/screen/auth/login.dart';
import 'package:tmdb_movie_app/screen/auth/register.dart';
import 'package:tmdb_movie_app/splash/splash.dart';


void main() async {
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
  ChangeNotifierProvider<CheckStorageMovieItem>(
    create: (_) => CheckStorageMovieItem(),
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
      home: SplashScreen(),
      // home: AllPagesNavigation(),
    );
  }
}

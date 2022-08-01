import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tmdb_movie_app/cubit/theme_cubit.dart';
import 'package:tmdb_movie_app/cubit/theme_state.dart';
import 'package:tmdb_movie_app/provider/connectivity/connectivity.dart';
import 'package:tmdb_movie_app/repository/repo.dart';
import 'package:tmdb_movie_app/bloc/search_bloc.dart';
import 'package:tmdb_movie_app/provider/movie/cSS_provider.dart';
import 'package:tmdb_movie_app/provider/movie/cS_provider.dart';
import 'package:tmdb_movie_app/provider/movie/mS_provider.dart';
import 'package:tmdb_movie_app/provider/movie/rS_providerr.dart';
import 'package:tmdb_movie_app/provider/storage/check_stoarge.dart';
import 'package:tmdb_movie_app/routes/naviagtion_routes.dart';
import 'package:tmdb_movie_app/screen/auth/login.dart';
import 'package:tmdb_movie_app/screen/auth/register.dart';
import 'package:tmdb_movie_app/splash/splash.dart';
import 'package:tmdb_movie_app/theme/dark.dart';
import 'package:tmdb_movie_app/theme/light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: providers,
      child: BlocProvider<SearchBloc>(
        create: (_) => SearchBloc(repository: ApiRepository()),
        child: MyApp(),
      ),
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
  ChangeNotifierProvider<AppConnectivityCheck>(
    create: (_) => AppConnectivityCheck(),
  ),
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var connectionStreamProvider =
        Provider.of<AppConnectivityCheck>(context, listen: false);
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movie App',
            theme:
                (state is ThemeLightState) ? LightTheme.data : DarkTheme.data,
            initialRoute: '/',
            routes: {
              loginPage: (context) => LoginPage(),
              registerPage: (context) => RegisterPage(),
            },
            home: StreamBuilder<ConnectivityWrapper>(
              stream: connectionStreamProvider.getConnectWrapper,
              builder: (context, snapshot) {
                if (snapshot.data?.isConnected != null) {
                  return SizedBox();
                }
                return SafeArea(
                  child: SplashScreen(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

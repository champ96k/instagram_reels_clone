import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:instagram_reels/core/dependency_injection/service_loactor.dart';
import 'package:instagram_reels/core/repositories/reels_repository.dart';
import 'package:instagram_reels/cubit/reels_cubit.dart';
import 'package:instagram_reels/screen/home_screen.dart';

void main() {
  serviceLoactor();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Reels Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ReelsCubit>(
            create: (context) => ReelsCubit(
              repository: GetIt.I<ReelsRepository>(),
            ),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}

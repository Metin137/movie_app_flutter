import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/cubit/movie_cubit.dart';
import 'package:movie_app/themes/themes_provider.dart';
import 'package:movie_app/widgets/app_scroll_behavior.dart';
import 'package:provider/provider.dart';
import 'route/route.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemesProvider()),
        BlocProvider<MovieCubit>(
          create: (BuildContext context) => MovieCubit(),
        ),
      ],
      builder: (context, themeData) {
        return ScreenUtilInit(
          builder: () {
            return FutureBuilder(
              future: context.read<ThemesProvider>().getActiveTheme(),
              builder: (_, snapShot) {
                if (snapShot.hasData) {
                  SystemChrome.setSystemUIOverlayStyle(
                    SystemUiOverlayStyle(
                      statusBarColor: context.watch<ThemesProvider>().getColors.primary,
                    ),
                  );

                  return MaterialApp(
                    title: 'Flutter Demo',
                    scrollBehavior: AppScrollBehavior(),
                    debugShowCheckedModeBanner: false,
                    theme: context.watch<ThemesProvider>().themeData,
                    onGenerateRoute: route.controller,
                    initialRoute: route.homeScreen,
                  );
                }
                return Container();
              },
            );
          },
        );
      },
    );
  }
}

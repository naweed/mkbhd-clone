import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mkbhd_clone/shared/app_colors.dart';
import 'package:mkbhd_clone/shared/app_constants.dart';
import 'package:mkbhd_clone/views/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: AppConstants.ApplicationName,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.PageBackgroundColor,
      ).copyWith(
        visualDensity: VisualDensity.standard,
      ),
      home: StartPage(),
    ).animate().fadeIn(
          delay: AppConstants.MicroDuration.milliseconds,
          duration: AppConstants.SmallDuration.milliseconds,
        );
  }
}

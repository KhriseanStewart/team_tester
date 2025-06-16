import 'package:car_wash_app/screen/auth/log_in.dart';
import 'package:car_wash_app/screen/auth/sign_up.dart';
import 'package:car_wash_app/screen/intro_screen/intro_screen.dart';
import 'package:car_wash_app/screen/job_list_screen/job_list.dart';
import 'package:car_wash_app/screen/main/main_layout.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String intro = '/intro';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String mainlayout = '/mainlayout';
  static const String joblist = '/joblist';

  static Map<String, WidgetBuilder> routes = {
    intro: (context) => const IntroScreen(),
    login: (context) => const LogIn(),
    signup: (context) => const SignUp(),
    mainlayout: (context) => const MainLayout(),
    joblist: (context) => const JobList(),
  };
}

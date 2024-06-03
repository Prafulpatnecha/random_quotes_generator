import 'package:flutter/material.dart';

import '../home/home_screen/home_page.dart';

class AppRoutes
{
  static Map<String, Widget Function(BuildContext)> routes={
    '/':(context)=>const HomePage()
  };
}
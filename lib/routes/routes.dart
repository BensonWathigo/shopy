import 'package:ecommerce/pages/dashboard.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:get/get.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => LoginPage()),
    GetPage(name: "/homepage", page: () => const MyHomePage()),
  ];
}
import 'package:ecommerce_user/auth/auth_service.dart';
import 'package:ecommerce_user/pages/login_page.dart';
import 'package:ecommerce_user/pages/product_list_page.dart';
import 'package:flutter/material.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = '/launcher';
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      if(AuthService.currentUser == null ) {
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }else {
        Navigator.pushReplacementNamed(context, ProductListPage.routeName);
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
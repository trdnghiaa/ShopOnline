import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopvippro_demo/pages/login_page.dart';
import 'package:shopvippro_demo/pages/Register_page.dart';
import 'package:shopvippro_demo/views/splash_page.dart';
import 'package:shopvippro_demo/views/home_fragment.dart';
import 'package:shopvippro_demo/widgets/category_provider.dart';
import 'package:shopvippro_demo/widgets/favorites_provider.dart';
import 'package:shopvippro_demo/widgets/login_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoritesProvider>(
          create: (context) =>
              FavoritesProvider(), // Khởi tạo FavoritesProvider ở đây
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (context) =>
              LoginProvider(), // Khởi tạo CategoryProvider ở đây
        ),
        // Các provider khác nếu cần thiết có thể được thêm vào đây
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.nunitoSansTextTheme(),
          ),
          initialRoute: '/splash', // Định nghĩa route khởi đầu
          routes: {
            '/splash': (context) => SplashPage(), // Route cho trang Splash
            '/login': (context) => LoginPage(
                  onLoginSuccess: () {
                    // Xử lý sau khi đăng nhập thành công
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ), // Định nghĩa route cho trang đăng nhập và truyền tham số 'onLoginSuccess'
            '/home': (context) => HomeFragment(),
            '/register': (context) => RegisterPage(),
          } // Route cho trang chủ
          ),
    );
  }
}

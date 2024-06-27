import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopvippro_demo/views/Splash_Screen.dart';

void main() {
  runApp(const MyApp());
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
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(), // Khởi tạo AuthProvider ở đây
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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopvippro_demo/pages/Login_page.dart';
import 'package:shopvippro_demo/pages/Register_page.dart';
import 'package:shopvippro_demo/services/AuthServiceProvider.dart';
import 'package:shopvippro_demo/views/Splash_page.dart';
import 'package:shopvippro_demo/views/home_fragment.dart';
import 'package:shopvippro_demo/widgets/favorites.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoritesProvider>(
          create: (_) =>
              FavoritesProvider(), // Khởi tạo FavoritesProvider ở đây
        ),
        ChangeNotifierProvider<AuthServiceProvider>(
          create: (_) => AuthServiceProvider(), // Khởi tạo AuthProvider ở đây
        ),
        // Các provider khác nếu cần thiết có thể được thêm vào đây
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.nunitoSansTextTheme(),
          ),
          home: const SplashPage(),
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

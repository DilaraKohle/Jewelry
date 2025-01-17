import 'package:flutter/material.dart';
import 'package:jewelry/screens/home.dart';
import 'package:jewelry/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainView(
        onLoginPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        },
      ),
    );
  }
}

class MainView extends StatefulWidget {
  final VoidCallback onLoginPressed;

  const MainView({super.key, required this.onLoginPressed});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

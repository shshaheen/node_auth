import 'package:flutter/material.dart';
import 'package:node_auth/providers/user_provider.dart';
// import 'package:node_auth/screens/home_screen.dart';
import 'package:node_auth/screens/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ],
  child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Node Auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignupScreen() ,
    );
  }
}


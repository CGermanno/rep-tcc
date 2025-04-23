import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tcc_melhor_de_todos/app/app_routes.dart';
import 'firebase_options.dart';
import 'package:device_preview/device_preview.dart'; // Adiciona o DevicePreview

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Firebase com as opções do firebase_options.dart
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    DevicePreview(
      // Envolva o app com o DevicePreview
      enabled:
          !kReleaseMode, // Ativa o DevicePreview somente em modo de desenvolvimento
      builder: (context) => const MyApp(), // Seu widget principal
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
      builder:
          DevicePreview.appBuilder, // Adiciona a integração com o DevicePreview
    );
  }
}

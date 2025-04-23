import 'package:flutter/material.dart';
import 'package:tcc_melhor_de_todos/pages/auth/login_page.dart';
import 'package:tcc_melhor_de_todos/pages/auth/phone_login_page.dart';
import 'package:tcc_melhor_de_todos/pages/shoppingLists/lista_compra.dart';
import 'package:tcc_melhor_de_todos/pages/home/home_page.dart';
import 'package:tcc_melhor_de_todos/pages/shoppingLists2/categories.dart';
import '../pages/auth/signup_page.dart';

// Importe outras páginas conforme forem sendo criadas

class AppRoutes {
  // Nomes centralizados das rotas (boa prática)
  static String home = '/';
  static String login = '/login';
  static String signup = '/signup';
  static String phonel = '/phone';
  static String listacompra = '/shoppingList';
  static String categories = '/categories';
  // Adicione mais rotas conforme necessário

  static Map<String, WidgetBuilder> get routes => {
    login: (context) => LoginPage(),
    signup: (context) => SignupPage(),
    phonel: (context) => const PhoneLoginPage(),
    home: (context) => HomePage(),
    listacompra: (context) => FavoritesListPage(),
    categories: (context) => CategoriasPage(),

    // Adicione outras aqui, ex:
    // '/profile': (context) => const ProfilePage(),
  };
}

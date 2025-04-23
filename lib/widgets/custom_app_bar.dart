import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final bool hideBackButton;

  const CustomAppBar({super.key, this.actions, this.hideBackButton = false});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final List<String> _phrases = [
    "Suas Receitas, Seu Jeito",
    "Receitas do Seu Jeito",
    "Receitas Que Encantam",
    "O Sabor da Sua Criatividade",
    "Bem-vindo(a) à Sua Cozinha",
  ];

  late String _selectedPhrase;

  @override
  void initState() {
    super.initState();
    _selectedPhrase = _phrases[Random().nextInt(_phrases.length)];
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepOrange,
      centerTitle: true,
      title: Text(
        _selectedPhrase,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xFFF9F5F0),
            letterSpacing: 1.1,
          ),
        ),
      ),
      actions: widget.actions,
      automaticallyImplyLeading: !widget.hideBackButton,
      elevation: 4,
      shadowColor: Colors.black26,
    );
  }
}

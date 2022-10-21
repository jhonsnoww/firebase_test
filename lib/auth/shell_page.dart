import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///If Loged In  -> Go Home
///If Not -> Go Login Page

class ShellPage extends StatefulWidget {
  const ShellPage({super.key});

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

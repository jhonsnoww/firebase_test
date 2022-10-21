import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordPage extends StatefulWidget {
  final String email;
  const PasswordPage({super.key, required this.email});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  void initState() {
    super.initState();
    // Future.microtask(() => checkUserCredential());
  }

  void checkUserCredential() async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: "oochanbg@gmail.com", password: "Binga@31288498");

      if (result.user != null) {
        await result.user!.sendEmailVerification();
        log("Email Send");
      }
      log('user :: ${result.user}');
    } on FirebaseAuthException catch (e) {
      log('E ${e.message}');
    } catch (e) {
      log('E $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Into',
                  style: GoogleFonts.abel(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                Text("Your account.",
                    style: GoogleFonts.lato(
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                        fontSize: 12)),
                const SizedBox(
                  height: 48,
                ),
                TextFormField(
                  enabled: false,
                  controller: TextEditingController(text: widget.email),
                  readOnly: true,
                  style: const TextStyle(color: Colors.black26),
                  decoration: const InputDecoration(
                      enabled: false, label: Text("Email")),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.length < 8) {
                      return "Password must be at least 8.";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(label: Text("Password")),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Sign In")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

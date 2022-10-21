import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_firebase/auth/password_page.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final emailCtr = TextEditingController(text: "oochanbg@gmail.com");
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
                  controller: emailCtr,
                  decoration: const InputDecoration(label: Text("Email")),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (b) => PasswordPage(
                                  email: emailCtr.text,
                                )));
                      },
                      child: const Text("Next")),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 48,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          elevation: 5,
                          side: const BorderSide(color: Colors.black12),
                          backgroundColor: Colors.white24,
                          foregroundColor: Colors.black),
                      onPressed: () {},
                      child: const Text("Forgot Password")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

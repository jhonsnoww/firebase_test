import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  'Sign Up',
                  style: GoogleFonts.abel(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                Text("It's quick and easy.",
                    style: GoogleFonts.lato(
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                        fontSize: 12)),
                const SizedBox(
                  height: 48,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "No Spam , Promise", label: Text("Email")),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(label: Text("Password")),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  obscureText: true,
                  decoration:
                      const InputDecoration(label: Text("Confirm Password")),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Sign Up")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

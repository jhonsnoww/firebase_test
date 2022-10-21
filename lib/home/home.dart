import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final collectionRef =
          await FirebaseFirestore.instance.collection('data').get();
      collectionRef.docs.map((e) {
        log('data ${e.data()}');
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
        actions: [
          IconButton(
            onPressed: () {
              log("Pressed");
            },
            icon: const Icon(Icons.network_check),
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: const Text("Click Me")),
      ),
    );
  }
}

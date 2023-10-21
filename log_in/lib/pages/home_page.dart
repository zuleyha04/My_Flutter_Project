import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Kullanıcı nesnesini alın
  final user = FirebaseAuth.instance.currentUser;

  // Kullanıcıyı oturumdan çıkaran metod
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text(
          "LOGGED IN AS: ${user?.email ?? 'No user logged in'}",
          // null güvenliği kullanarak email'e erişin
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

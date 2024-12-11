import 'package:flutter/material.dart';
import '../services/auth_google.dart';

class LoginPage extends StatelessWidget {
  final Authuser _authuser = Authuser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login con Google'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final user = await _authuser.LoginGoogle();
              if (user != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Inicio de sesión exitoso como: ${user.displayName}')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Inicio de sesión cancelado')),
                );
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error al iniciar sesión: $e')),
              );
            }
          },
          child: Text('Iniciar sesión con Google'),
        ),
      ),
    );
  }
}
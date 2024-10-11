import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 100,
                width: 100,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Correo Electrónico',
                  label: Text('Correo Electrónico'),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: _email,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Contraseña',
                    label: const Text('Contraseña'),
                    labelStyle: const TextStyle(color: Colors.black),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off))),
                controller: _password,
                obscureText: _isObscure,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: ElevatedButton(
                    onPressed: () {
                      print('User: $_email');
                      print('Pass: $_password');
                    },
                    child: const Text('Iniciar Sesión')),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/sendemail");
                  print('presionado');
                },
                child: const Text("Recuperar Contraseña", style: TextStyle(fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:appcep/repository/cep.repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cep = CepRepository();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                var ceps = await cep.obterCep();
                print("AQUI SERIA O JSON FINAL");
                print(ceps);
              },
              child: const Text("Obter dados"))
        ],
      ),
    ));
  }
}

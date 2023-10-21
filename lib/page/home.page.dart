import 'package:appcep/model/viacep_model.dart';
import 'package:appcep/repository/viacep_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cepController = TextEditingController(text: "");
  var viacepModel = ViaCEPModel();
  var viacepRepository = ViaCEPRepository();
  bool loading = false;
  obeterCep(String cep) async {
    if (cep.length == 8) {
      setState(() {
        loading = true;
        FocusManager.instance.primaryFocus?.unfocus();
      });
      viacepModel = await viacepRepository.consultarCep(cep);
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Text("Consulta CEP",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(
              maxLength: 8,
              keyboardType: TextInputType.number,
              controller: cepController,
              onChanged: (String value) async {
                // var cep = value.trim().replaceAll('-', '');
                var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                obeterCep(cep);
              },
            ),
            const SizedBox(height: 50),
            Text(viacepModel.logradouro ?? "",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            Visibility(
                visible: loading, child: const CircularProgressIndicator()),
            Text("${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ElevatedButton(onPressed: () {}, child: Text("Salvar")),
          ],
        ),
      ),
    ));
  }
}

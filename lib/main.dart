import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controllerPeso = TextEditingController();
  final TextEditingController _controllerAltura = TextEditingController();
  String _resultado = 'Insira Seu Peso e Altura';

  void _calcular() {
    if (_controllerPeso.text == null || _controllerPeso.text.isEmpty) {
      _resultado = 'Insira seu Peso';
    } else if (_controllerAltura.text == null ||
        _controllerAltura.text.isEmpty) {
      _resultado = 'Insira a sua Altura';
    } else {
      double peso = double.parse(_controllerPeso.text);
      double altura = double.parse(_controllerAltura.text) / 100.0;
      double imc = peso / (altura * altura);
      if (imc > 40.0) {
        _resultado =
            'Seu resultado foi ${imc.toStringAsPrecision(4)} \nVocê está em Obesidade Grau III';
      } else if (imc > 35.0 && imc < 39.9) {
        _resultado =
            'Seu resultado foi ${imc.toStringAsPrecision(4)} \nVocê está em Obesidade Grau II';
      } else if (imc > 30.0 && imc < 34.9) {
        _resultado =
            'Seu resultado foi ${imc.toStringAsPrecision(4)} \nVocê está em Obesidade Grau I';
      } else if (imc > 25.0 && imc < 29.9) {
        _resultado =
            'Seu resultado foi ${imc.toStringAsPrecision(4)} \nVocê está em sobrepeso';
      } else if (imc > 18.6 && imc < 24.9) {
        _resultado =
            'Seu resultado foi ${imc.toStringAsPrecision(4)} \nVocê está em peso ideal';
      } else if (imc > 17.0 && imc < 18.5) {
        _resultado =
            'Seu resultado foi ${imc.toStringAsPrecision(4)} \nVocê está em magreza leve';
      } else if (imc > 16.0 && imc < 16.9) {
        _resultado =
            'Seu resultado foi ${imc.toStringAsPrecision(4)} \nVocê está em magreza moderada';
      } else if (imc < 16.0) {
        _resultado =
            'Seu resultado foi ${imc.toStringAsPrecision(4)} \nVocê está em magreza grave';
      }
    }
    setState(() {
      _resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Color.fromARGB(255, 59, 178, 38),
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10),
              Image.asset(
                'assets/logo.png',
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Peso em Kg',
                  hintText: 'Digite o seu peso em kg',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                ),
                controller: _controllerPeso,
              ),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Altura em cm',
                  hintText: 'Digite a sua altura em cm',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                ),
                controller: _controllerAltura,
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: 800,
                child: ElevatedButton(
                  child: const Text(
                    'CALCULAR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(247, 46, 46, 1),
                      fontSize: 25,
                    ),
                  ),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


import '../modelos/planeta.dart';


class TelaPlaneta extends StatefulWidget {
  const TelaPlaneta({super.key});


  @override
  State<TelaPlaneta> createState() => _TelaPlanetaState();
}


class _TelaPlanetaState extends State<TelaPlaneta> {
  final _formKey = GlobalKey<FormState>();


  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _tamanhoController = TextEditingController();
  final TextEditingController _distanciaController = TextEditingController();
  final TextEditingController _apelidoController = TextEditingController();


  final Planeta _planeta = Planeta.vazio();


  @override
  void initState() {
    _nomeController.text = 'Terra';
    _tamanhoController.text = '12742';
    _distanciaController.text = '1000';
    _apelidoController.text = 'Nossa Casa';
    super.initState();
  }


  @override
  void dispose() {
    _nomeController.dispose();
    _tamanhoController.dispose();
    _distanciaController.dispose();
    _apelidoController.dispose();
    super.dispose();
  }


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dados salvo com suceesso!')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cadastrar Planetas'),
        elevation: 3,
      ),
      body: Padding(
        padding: EdgeInsets.all(35.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: 'nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        16.0,
                      ), // Borda arredondada
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 3) {
                      return 'Por favor, insira um nome';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _planeta.nome = value!;
                  }
                ),
                TextFormField(
                  controller: _tamanhoController,
                  decoration: InputDecoration(
                    labelText: 'Tamanho (em km)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        16.0,
                      ), // Borda arredondada
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um tamanho';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Por favor, insira um número válido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _planeta.tamanho = double.parse(value!);
                  },
                ),
                TextFormField(
                  controller: _distanciaController,
                  decoration: InputDecoration(
                    labelText: 'Distância (em km)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        16.0,
                      ), // Borda arredondada
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma distancia';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Por favor, insira um número válido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _planeta.distancia = double.parse(value!);
                  },
                ),
                TextFormField(
                  controller: _apelidoController,
                  decoration: InputDecoration(
                    labelText: 'Apelido',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        16.0,
                      ), // Borda arredondada
                    ),
                  ),
                  onSaved:(value) {
                    _planeta.apelido = value;
                  },
                ),


                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _submitForm, // _submitForm,
                  child: Text('Salvar'),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}

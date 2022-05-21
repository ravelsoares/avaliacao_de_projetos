import 'package:avaliacao_empreendedorismo/models/evaluation_list.dart';
import 'package:avaliacao_empreendedorismo/models/evaluation.dart';
import 'package:avaliacao_empreendedorismo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormEvaluation extends StatefulWidget {
  final String name;
  const FormEvaluation(this.name, {Key? key}) : super(key: key);

  @override
  State<FormEvaluation> createState() => _FormEvaluationState();
}

class _FormEvaluationState extends State<FormEvaluation> {
  final _nameController = TextEditingController();
  final _noteController = TextEditingController();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Form(
          key: _keyForm,
          child: Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              left: 10,
              right: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                TextFormField(
                    controller: _nameController,
                    decoration:
                        const InputDecoration(labelText: 'Avaliado Por:'),
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return 'Informe seu nome';
                      } else if (name.length < 3) {
                        return 'Nome precisa ter mais de 3 letras';
                      }
                      return null;
                    }),
                TextFormField(
                  controller: _noteController,
                  decoration: const InputDecoration(labelText: 'Nota'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: (note) {
                    if (note!.isEmpty) {
                      return 'Adicione uma nota';
                    } else if (double.parse(note) < 0) {
                      return 'A nota não pode ser negativa';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    confirmEvaluation();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          confirmEvaluation();
                        }
                      },
                      child: Text(
                        'Salvar',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void confirmEvaluation() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Avaliando ${widget.name}'),
          content: Text(
              'Tem certeza que quer avaliar com ${_noteController.text} ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
                Provider.of<EvaluationList>(context, listen: false)
                    .addEvaluation(Evaluation(
                        avaliador: _nameController.text,
                        avaliado: widget.name,
                        note: _noteController.text.isEmpty
                            ? 0
                            : double.parse(_noteController.text)));
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
  /*Provider.of<EvaluationList>(context, listen: false)
                        .addEvaluation(Evaluation(
                            avaliador: _nameController.text,
                            avaliado: widget.name,
                            note: double.parse(_noteController.text)));*/
}

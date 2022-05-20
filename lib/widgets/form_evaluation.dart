import 'package:avaliacao_empreendedorismo/models/evaluation_list.dart';
import 'package:avaliacao_empreendedorismo/models/evaluation.dart';
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.0,
            left: 10,
            right: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Avaliado Por:'),
              ),
              TextField(
                controller: _noteController,
                decoration: const InputDecoration(labelText: 'Nota'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) {
                  Provider.of<EvaluationList>(context, listen: false)
                      .addEvaluation(Evaluation(
                          avaliador: _nameController.text,
                          avaliado: widget.name,
                          note: double.parse(_noteController.text)));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Provider.of<EvaluationList>(context, listen: false)
                          .addEvaluation(Evaluation(
                              avaliador: _nameController.text,
                              avaliado: widget.name,
                              note: _noteController.text.isEmpty
                                  ? 0
                                  : double.parse(_noteController.text)))
                          .then((_) => Navigator.of(context).pop());
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
    );
  }
}

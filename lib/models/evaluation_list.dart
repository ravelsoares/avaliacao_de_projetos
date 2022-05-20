import 'package:avaliacao_empreendedorismo/models/evaluation.dart';
import 'package:avaliacao_empreendedorismo/models/result.dart';
import 'package:avaliacao_empreendedorismo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EvaluationList extends ChangeNotifier {
  List<Result> _results = [];

  List<Result> get results => [..._results];

  Future<void> addEvaluation(Evaluation evaluation) async {
    final response = await http.post(
      Uri.parse('${App.evaluationBaseUrl}.json'),
      body: jsonEncode({
        'avaliador': evaluation.avaliador,
        'avaliado': evaluation.avaliado,
        'note': evaluation.note,
      }),
    );
  }

  Future<void> loadEvaluations() async {
    _results.clear();
    final response = await http.get(Uri.parse('${App.evaluationBaseUrl}.json'));
    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);
    for (String name in App.alunos) {
      double total = 0;
      int avaliacoes = 0;
      data.forEach((id, EvaluationData) {
        if (name == EvaluationData['avaliado'].toString()) {
          total += EvaluationData['note'] as double;
          avaliacoes += 1;
        }
      });
      _results.add(Result(
          avaliado: name, media: total / avaliacoes, avaliacoes: avaliacoes));
    }
    notifyListeners();
  }
}

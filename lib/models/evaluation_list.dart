import 'package:avaliacao_empreendedorismo/models/evaluation.dart';
import 'package:avaliacao_empreendedorismo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EvaluationList extends ChangeNotifier{
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
}

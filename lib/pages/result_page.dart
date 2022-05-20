import 'package:avaliacao_empreendedorismo/models/evaluation_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/result_item.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<EvaluationList>(context, listen: false).loadEvaluations();
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<EvaluationList>(context).results);
    return Scaffold(
      body: ListView.builder(
        itemCount: Provider.of<EvaluationList>(context).results.length,
        itemBuilder: (context, index) {
          return ResultItem(
              Provider.of<EvaluationList>(context).results[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<EvaluationList>(context, listen: false).loadEvaluations();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

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
    
    return Scaffold(
      body: Provider.of<EvaluationList>(context).results.isNotEmpty
          ? Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemCount:
                        Provider.of<EvaluationList>(context).results.length,
                    itemBuilder: (context, index) {
                      return ResultItem(
                          Provider.of<EvaluationList>(context).results[index]);
                    },
                  ),
                ),
                const Center(
                  child: Text(
                    'Desenvolvido por Ravel Soares',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          : Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/gifs/without_evaluation.gif',
                    fit: BoxFit.cover,
                  ),
                ),
                const Text(
                  'Nenhuma avaliação feita',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
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

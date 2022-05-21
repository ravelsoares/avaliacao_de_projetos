import 'package:flutter/material.dart';

import '../models/result.dart';

class ResultItem extends StatelessWidget {
  final Result result;
  const ResultItem(this.result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      result.avaliado,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    result.media >= 70
                        ? Icons.check
                        : result.avaliacoes == 0
                            ? Icons.remove
                            : Icons.dangerous,
                    color: result.media >= 70
                        ? Colors.green
                        : result.avaliacoes == 0
                            ? Colors.grey
                            : Colors.red,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Média: ${result.media.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 13),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Avaliações: ${result.avaliacoes}',
                    style: TextStyle(fontSize: 13),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

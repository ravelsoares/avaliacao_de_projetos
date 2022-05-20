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
              Text(
                result.avaliado,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Média: ${result.media}'),
                  const SizedBox(width: 20),
                  Text('Avaliações: ${result.avaliacoes}')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

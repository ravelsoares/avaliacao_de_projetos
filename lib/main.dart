import 'package:avaliacao_empreendedorismo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/evaluation_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EvaluationList(),
        ),
      ],
      child: MaterialApp(
        title: 'Avaliação de Trabalhos',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

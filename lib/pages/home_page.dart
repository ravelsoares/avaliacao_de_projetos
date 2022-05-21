import 'package:avaliacao_empreendedorismo/pages/result_page.dart';
import 'package:avaliacao_empreendedorismo/widgets/form_evaluation.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/presentation_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Avaliando Projetos de Empreendedorismo'),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.book)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: App.alunos.length,
              itemBuilder: (context, index) {
                return PresentationItem(
                    App.alunos[index], openModalBottomSheet);
              },
            ),
            const ResultPage()
          ],
        ),
      ),
    );
  }

  void openModalBottomSheet(String name) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return FormEvaluation(name);
      },
    );
  }
}

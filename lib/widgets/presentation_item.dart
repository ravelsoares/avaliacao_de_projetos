import 'package:flutter/material.dart';

class PresentationItem extends StatelessWidget {
  final String name;
  final Function toAssess;
  const PresentationItem(this.name, this.toAssess, {Key? key}) : super(key: key);

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
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextButton(
                  onPressed: () {
                    toAssess(name);
                  },
                  child: const Text('Avaliar'))
            ],
          ),
        ),
      ),
    );
  }
}

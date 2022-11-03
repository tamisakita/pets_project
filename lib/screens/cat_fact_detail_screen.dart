import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_project/models/cat_fact_model.dart';

class CatFactDetailScreen extends StatelessWidget {
  static const String id = 'cat_fact_detail_screen';
  final CatFact catFact;

  CatFactDetailScreen(this.catFact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: Text('Cat Fact Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/images/cat-four.png'),
            Text(
              catFact.fact,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              )
            )
          ],
        ),
      ),
    );
  }
}

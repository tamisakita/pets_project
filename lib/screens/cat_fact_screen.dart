import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pets_project/models/cat_fact_model.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class CatFactScreen extends StatefulWidget {
  static const String id = 'cat_fact_screen';
  const CatFactScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CatFactScreenState();
}

class _CatFactScreenState extends State<CatFactScreen> {
  var catFactList = <CatFact>[];

  @override
  void initState() {
    super.initState();
    HttpOverrides.global = MyHttpOverrides();
    fetchCatFact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: catFactList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (_, index) {
            final catFact = catFactList[index];
            return Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(16),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            catFact.fact,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Text(
                          //   catFact.length,
                          //   style: const TextStyle(
                          //     fontSize: 16,
                          //   ),
                          //   maxLines: 5,
                          //   overflow: TextOverflow.ellipsis,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void fetchCatFact() async {
    try {
      final uri = Uri.parse('https://catfact.ninja/facts');
      final response = await Client().get(uri);

      final responseJson = jsonDecode(response.body);

      catFactList = responseJson['data']
          .map<CatFact>((jsonCat) => CatFact(
        fact: jsonCat['fact'],
        // length: jsonCat['length'],
      ))
          .toList();

      setState(() {});
    } catch (error) {
      print('erro');
    }
  }
}

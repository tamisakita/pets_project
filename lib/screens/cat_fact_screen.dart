import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pets_project/models/cat_fact_model.dart';
import 'package:pets_project/screens/cat_fact_detail_screen.dart';

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

      backgroundColor:  Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: Text('Cat Facts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: catFactList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (_, index) {
            final catFact = catFactList[index];
            return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CatFactDetailScreen(catFact)));
                  },
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              catFact.fact,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Container(
                            //   child: InkWell(
                            //     onTap: () {
                            //       Navigator.push(context, MaterialPageRoute(builder: (context) => CatFactDetailScreen(catFact)));
                            //     },
                            //   ),
                            //     // child: Icon(Icons.arrow_forward_ios_sharp,)
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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

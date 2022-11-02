import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets_project/screens/menu_screen.dart';
import 'package:pets_project/models/cat_model.dart';
import '../components/rounded_button.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class CatFactsScreen extends StatefulWidget {
  static const String id = 'cat_facts_screen';
  const CatFactsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CatFactsScreenState();
}

class _CatFactsScreenState extends State<CatFactsScreen> {
  var catList = <Cat>[];

  @override
  void initState() {
    super.initState();
    HttpOverrides.global = MyHttpOverrides();
    fetchCats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      // body: SafeArea(
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         SizedBox(height: 16),
      //         Text(
      //           'Cat trivia',
      //           style: GoogleFonts.concertOne(
      //             fontSize: 56,
      //           ),
      //         ),
      //         SizedBox(height: 50),
      //
      //         // button discover
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
      //           child: RoundedButton(
      //             icon: Icons.person,
      //             text: 'Discover',
      //             onTap: () {
      //               Navigator.pushNamed(
      //                 context,
      //                 CatFactsScreen.id,
      //               );
      //             },
      //           ),
      //         ),
      //
      //
      //         // go back
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
      //           child: RoundedButton(
      //             icon: Icons.person,
      //             text: 'Back',
      //             onTap: () {
      //               Navigator.pushNamed(
      //                 context,
      //                 MenuScreen.id,
      //               );
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: catList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (_, index) {
            final movie = catList[index];
            return Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(16),
              child: Row(
                children: [
                  // Expanded(
                  //   flex: 3,
                  //   child: ClipRRect(
                  //       borderRadius: const BorderRadius.only(
                  //         topLeft: Radius.circular(16),
                  //         bottomLeft: Radius.circular(16),
                  //       ),
                  //       child: Image.network(movie.image)),
                  // ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.text,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Text(
                          //   movie.description,
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

  void fetchCats() async {
    try {
      final uri = Uri.parse('https://cat-fact.herokuapp.com');
      final response = await Client().get(uri);

      final responseJson = jsonDecode(response.body);

      catList = responseJson['facts']
          .map<Cat>((jsonCat) => Cat(
        id: jsonCat['_id'],
        text: jsonCat['text'],
      ))
          .toList();

      setState(() {});
    } catch (error) {
      print('erro');
    }
  }
}
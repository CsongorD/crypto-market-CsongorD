// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:frontend/widgets/crypto_list_widget.dart';
import 'dart:convert'; // required to encode/decode json data
import 'package:http/http.dart' as http;
import 'Crypto.dart';
import 'package:flutter/foundation.dart';

class CryptoList extends StatefulWidget {
  const CryptoList({super.key});

  @override
  State<CryptoList> createState() => _CryptoListState();
}

class _CryptoListState extends State<CryptoList> {
  Future<List<Crypto>> cryptosFuture = fetchCryptos();

  static Future<List<Crypto>> fetchCryptos() async {
    String host = defaultTargetPlatform == TargetPlatform.android
        ? "10.0.2.2"
        : 'localhost';
    var url = Uri.parse("http://$host:8000/api/v1/cryptos");
    var headers = {'Content-Type': "application/json"};
    final response = await http.get(url, headers: headers);
    final List body = json.decode(response.body)["data"];
    return body.map((e) => Crypto.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Center(
        // FutureBuilder
        child: FutureBuilder<List<Crypto>>(
          future: cryptosFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // until data is fetched, show loader
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              // once data is fetched, display it on screen (call buildPosts())
              final cryptos = snapshot.data!;
              return CryptoListWidget(cryptos);
            } else {
              // if no data, show simple Text
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }
}

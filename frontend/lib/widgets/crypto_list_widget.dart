// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend/widgets/Crypto.dart';

class CryptoListWidget extends StatefulWidget {
  List<Crypto> cryptos;
  CryptoListWidget(this.cryptos, {super.key});

  @override
  State<CryptoListWidget> createState() => _CryptoListWidgetState();
}

class _CryptoListWidgetState extends State<CryptoListWidget> {
  int _page = 0;
  final int _perPage = 10;

  @override
  Widget build(BuildContext context) {
    List<Crypto> cryptos = widget.cryptos;
    final dataToShow =
        cryptos.sublist((_page * _perPage), ((_page * _perPage) + _perPage));

    return Container(
      color: Colors.blueGrey[800],
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              color: Colors.grey[900],
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "Name",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "Value",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "Change in 24h",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: dataToShow.length,
              itemBuilder: (context, index) {
                dataToShow[index].roundNumber(5566658.156649);
                final crypto = dataToShow[index];

                return Container(
                  color: Colors.blueGrey[900],
                  margin:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            /*  Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 4),
                                        child: Image.asset(
                                        'assets/cryptos/${crypto.icon!}.png',
                                        width: 20,
                                        height: 50,
                                        ),
                                      ),*/
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 4),
                                child: Text(
                                  crypto.symbol!,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                crypto.name!,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 126, 126, 126)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${crypto.price!}\$',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${crypto.changeIn24h!}%',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Flexible(
            child: Container(
              color: Colors.grey[900],
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: ElevatedButton(
                        onPressed: _page != 0
                            ? () => setState(() => _page -= 1)
                            : null,
                        child: const Text(
                          'Prev',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Flexible(
                      child: ElevatedButton(
                        onPressed: (_page + 1) * _perPage < cryptos.length
                            ? () => setState(() => _page += 1)
                            : null,
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900], //hange this
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                      child: Text(
                        "The best Crypto Wallet website",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: Text(
                        "'Of course it is.'",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900]),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "BUY CRYPTO",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Center(
              child: Container(
                width: 300,
                height: 300,
                child: CircleAvatar(
                  backgroundColor: Colors.brown,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularText(
                        radius: 150,
                        children: [
                          TextItem(
                            space: 3.5,
                            startAngle: 200,
                            text: const Text(
                                "BITCOIN•DIGITAL•DECENTRALIZED•PEER•TO•PEER",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                          ),
                          TextItem(
                            space: 3.5,
                            startAngle: 25,
                            text: const Text(
                                "1TROYOZ 999 FINE COPPER MJB MONETARY METALS",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 135,
                        backgroundColor: Color.fromARGB(194, 231, 169, 11),
                        child: Icon(
                          Icons.currency_bitcoin_rounded,
                          size: 250,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

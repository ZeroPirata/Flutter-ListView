import 'package:atividadeone/pages/four_page.dart';
import 'package:atividadeone/pages/second_page.dart';
import 'package:atividadeone/utils/products.dart';
import 'package:flutter/material.dart';

class BuyPhase extends StatefulWidget {
  const BuyPhase(
      {super.key, required this.productId, required this.quantidade});

  final int productId;
  final int quantidade;

  @override
  State<BuyPhase> createState() =>
      // ignore: no_logic_in_create_state
      _BuyPhaseState(productId: productId, quantidade: quantidade);
}

class _BuyPhaseState extends State<BuyPhase> {
  final int productId;
  final int quantidade;

  _BuyPhaseState({required this.productId, required this.quantidade});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Store"),
          automaticallyImplyLeading: false,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
          child: Container(
            width: 500,
            color: Colors.white,
            child: Center(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: itens.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = itens[index];
                      if (item['id'] == productId) {
                        return Center(
                            child: Card(
                          elevation: 2.0,
                          child: Column(children: [
                            Image(
                              image: AssetImage(item['assert']),
                              height: 250,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item['nome'],
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Total: \$${item['value'] * quantidade}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextButton(
                                  child: const Text('BUY'),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                const CompleteBuy()));
                                  },
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  child: const Text('CANCEL'),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                const StorePage()));
                                  },
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ]),
                        ));
                      }
                      return Container();
                    })),
          ),
        ),
      ),
    );
  }
}

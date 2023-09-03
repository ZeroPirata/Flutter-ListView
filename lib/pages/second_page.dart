import 'package:atividadeone/components/list_view_custom.dart';
import 'package:atividadeone/pages/three_page.dart';
import 'package:atividadeone/utils/products.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  void buyPhase(int id, int quantide) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => BuyPhase(
                  productId: id,
                  quantidade: quantide,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: itens.length,
            itemBuilder: (BuildContext context, int index) {
              final item = itens[index];
              final textController = TextEditingController();
              return ProductWidget(
                name: item['nome'],
                imageUrl: item['assert'],
                price: item['value'],
                textController: textController,
                onButtonPressed: () {
                  // Lógica para lidar com o botão (por exemplo, adicionar ao carrinho)
                  final quantity = int.tryParse(textController.text);
                  if (quantity != null && quantity > 0) {
                    buyPhase(item['id'], quantity);
                  }
                },
              );
            }));
  }
}

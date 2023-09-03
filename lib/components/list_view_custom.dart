import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String name;
  final double price;
  final TextEditingController textController;
  final VoidCallback onButtonPressed;
  final String imageUrl;

  const ProductWidget({
    super.key,
    required this.name,
    required this.price,
    required this.textController,
    required this.onButtonPressed,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            image: AssetImage(imageUrl),
            height: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$$price',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: onButtonPressed,
              child: const Text('Adicionar ao Carrinho'),
            ),
          ),
        ],
      ),
    );
  }
}

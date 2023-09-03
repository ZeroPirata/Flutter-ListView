import 'package:atividadeone/pages/second_page.dart';
import 'package:flutter/material.dart';

class CompleteBuy extends StatelessWidget {
  const CompleteBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                const Image(
                  width: 200,
                  height: 200,
                  image: AssetImage("sleeptoken.png"),
                ),
                const Text("Sleep Token Store",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 1,
                            color: Colors.grey,
                            offset: Offset(4, 2),
                          ),
                        ])),
                const Text("Order confirmed",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const StorePage()));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.lightGreen)),
                      label: const Text(
                        "Back",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      icon: const Icon(Icons.login,
                          size: 30, color: Colors.white),
                    )),
              ]),
            ),
          ),
        ));
  }
}

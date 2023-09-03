import 'package:atividadeone/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:atividadeone/components/input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String passwordValue = '';
  late String emailValue = '';

  late bool _errorVerify = false;
  late String _error = "";

  void handleEmailValueChanged(String value) {
    setState(() {
      emailValue = value;
    });
  }

  void sendEmailValidator(String value, BuildContext context) {
    if (value.contains("@")) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const StorePage()),
      );
    } else {
      setState(() {
        _errorVerify = true;
        _error = "Porfavor, insira um email válido";
      });
    }
  }

  void handlePasswordValueChanged(String value) {
    setState(() {
      passwordValue = value;
    });
  }

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
                SizedBox(
                    height: 100,
                    width: 600,
                    child: (Column(
                      children: [
                        Expanded(
                            child: InputComponent(
                          onValueChanged: handleEmailValueChanged,
                          placeholder: "Email",
                          inputType: TextInputType.emailAddress,
                        )),
                        Expanded(
                            child: InputComponent(
                          onValueChanged: handlePasswordValueChanged,
                          pwd: true,
                          placeholder: "Password",
                          inputType: TextInputType.text,
                        ))
                      ],
                    ))),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        sendEmailValidator(emailValue, context);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.lightGreen)),
                      label: const Text(
                        "Login",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      icon: const Icon(Icons.login,
                          size: 30, color: Colors.white),
                    )),
                _errorVerify
                    ? SizedBox(
                        child: Text(
                        _error,
                        style: const TextStyle(fontSize: 20, color: Colors.red),
                      ))
                    : const SizedBox()
              ]),
            ),
          ),
        ));
  }
}

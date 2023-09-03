import 'package:flutter/material.dart';

class InputComponent extends StatefulWidget {
  const InputComponent(
      {Key? key,
      this.pwd = false,
      required this.onValueChanged,
      required this.placeholder,
      required this.inputType})
      : super(key: key);

  final void Function(String) onValueChanged; // Callback para passar o valor.
  final String placeholder;
  final TextInputType inputType;
  final bool pwd;

  @override
  State<InputComponent> createState() =>
      // ignore: no_logic_in_create_state
      _InputComponentState(
          placeholder: placeholder,
          inputType: inputType,
          pwd: pwd);
}

class _InputComponentState extends State<InputComponent> {
  late TextEditingController _controller;
  final String placeholder;
  final TextInputType inputType;
  final bool pwd;

  _InputComponentState(
      {required this.placeholder, required this.inputType, required this.pwd});

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        controller: _controller,
        keyboardType: inputType,
        onChanged: widget.onValueChanged,
        obscureText: pwd ? true : false,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          hintText: placeholder,
        ),
      ),
    );
  }
}

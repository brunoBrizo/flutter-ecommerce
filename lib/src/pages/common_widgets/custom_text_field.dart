import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool isReadOnly;

  const CustomTextField(
      {Key? key,
      required this.icon,
      required this.label,
      this.isSecret = false,
      this.inputFormatters,
      this.initialValue,
      this.isReadOnly = false})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.isSecret;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        readOnly: widget.isReadOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        obscureText: obscureText,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            labelText: widget.label,
            isDense: true,
            suffixIcon: widget.isSecret
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off))
                : null,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(18.0))),
      ),
    );
  }
}
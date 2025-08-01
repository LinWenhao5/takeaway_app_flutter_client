import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String? label;
  final String? hintText;
  final Widget? prefixIcon;

  const PasswordInput({
    super.key,
    required this.controller,
    this.onChanged,
    this.label,
    this.hintText,
    this.prefixIcon,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(widget.label!, style: Theme.of(context).textTheme.labelMedium),
        if (widget.label != null) const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          onChanged: (value) {
            setState(() {});
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon:
                widget.controller.text.isNotEmpty
                    ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: _togglePasswordVisibility,
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}

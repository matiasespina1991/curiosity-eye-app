import 'package:flutter/material.dart';
import '../../app_settings/theme_settings.dart';

class ThemeInputTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final bool isPasswordInput;
  final bool isEmailInput;
  final bool disabled;
  final String variant;
  final Widget? suffixIcon;
  final bool hidePasswordVisibilityIcon;
  final bool isValid;
  final String? errorText;
  final Function(String)? onChanged;

  const ThemeInputTextField({
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.isPasswordInput = false,
    this.isEmailInput = false,
    this.disabled = false,
    this.variant = 'primary',
    this.suffixIcon,
    this.hidePasswordVisibilityIcon = false,
    required this.isValid,
    this.errorText,
    this.onChanged,
    super.key,
  });

  @override
  ThemeInputTextFieldState createState() => ThemeInputTextFieldState();
}

class ThemeInputTextFieldState extends State<ThemeInputTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration;

    bool isDark = Theme.of(context).brightness == Brightness.dark;

    if (ThemeSettings.textInputBorderStyle == 'no-border') {
      inputDecoration = InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 15.5,
          color: (ThemeSettings.glassTextInputs && !isDark)
              ? Colors.black87
              : null,
        ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(16.0),
        errorText: widget.isValid ? null : widget.errorText,
        suffixIcon: widget.isPasswordInput && !widget.hidePasswordVisibilityIcon
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: widget.disabled
                    ? null
                    : () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
              )
            : widget.suffixIcon,
      );
    } else {
      inputDecoration = InputDecoration(
        fillColor: ThemeSettings.glassTextInputs
            ? Colors.white.withOpacity(0.1)
            : null,
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 15.5,
          color: (ThemeSettings.glassTextInputs && !isDark)
              ? Colors.black87
              : null,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        errorText: widget.isValid ? null : widget.errorText,
        suffixIcon: widget.isPasswordInput && !widget.hidePasswordVisibilityIcon
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: widget.disabled
                    ? null
                    : () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
              )
            : widget.suffixIcon,
      );
    }

    return Container(
      decoration: ThemeSettings.textInputBorderStyle == 'no-border'
          ? BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(7),
            )
          : null,
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        decoration: inputDecoration,
        obscureText: widget.isPasswordInput && !_isPasswordVisible,
        enabled: !widget.disabled,
        onTap: widget.disabled ? null : () {},
      ),
    );
  }
}

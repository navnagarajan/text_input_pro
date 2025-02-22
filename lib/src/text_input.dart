import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_input_pro/src/input_validator.dart';

class TextInput extends StatefulWidget {
  final TextEditingController inputController;

  final String labelText;
  final String? helperText;

  final bool filled;
  final bool enabled;
  final bool readOnly;
  final bool showCursor;
  final bool autoFocus;
  final bool obscureText;
  final bool? border;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final InputDecoration? inputDecoration;
  final TextInputType? textInputType;
  final Function(String)? valueChange;

  final String? errorText;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final Widget? counter;
  final Function(String)? onFieldSubmitted;
  final Function()? onTap;
  final List<InputValidator>? validators;

  const TextInput(
    this.inputController,
    this.labelText, {
    super.key,
    this.helperText,
    this.filled = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.inputDecoration,
    this.textInputType,
    this.valueChange,
    this.readOnly = false,
    this.showCursor = false,
    this.autoFocus = false,
    this.errorText,
    this.obscureText = false,
    this.focusNode,
    this.inputFormatters,
    this.border,
    this.textCapitalization,
    this.counter,
    this.onFieldSubmitted,
    this.onTap,
    this.validators,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final _validationStreamCtrl = StreamController<String?>();

  TextEditingController get _inputController => widget.inputController;

  String get _labelText => widget.labelText;

  String? get _helperText => widget.helperText;

  bool get _filled => widget.filled;

  bool get _enabled => widget.enabled;

  Widget? get _prefixIcon => widget.prefixIcon;

  Widget? get _suffixIcon => widget.suffixIcon;

  InputDecoration? get _inputDecoration => widget.inputDecoration;

  TextInputType? get _textInputType => widget.textInputType;

  Function(String)? get _valueChange => widget.valueChange;

  bool get _readOnly => widget.readOnly;

  bool get _showCursor => widget.showCursor;

  bool get _autoFocus => widget.autoFocus;

  String? get _errorText => widget.errorText;

  bool get _obscureText => widget.obscureText;

  FocusNode? get _focusNode => widget.focusNode;

  List<TextInputFormatter>? get _inputFormatters => widget.inputFormatters;

  bool? get _border => widget.border;

  TextCapitalization? get _textCapitalization => widget.textCapitalization;

  Widget? get _counter => widget.counter;

  Function(String)? get _onFieldSubmitted => widget.onFieldSubmitted;

  Function()? get _onTap => widget.onTap;

  List<InputValidator>? get _validators => widget.validators;

  String? _mErrorText;

  @override
  void initState() {
    super.initState();
    _mErrorText = _errorText;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
        stream: _validationStreamCtrl.stream,
        builder: (context, snapshot) {
          return TextFormField(
            autocorrect: true,
            enableSuggestions: true,
            style: TextStyle(),
            focusNode: _focusNode,
            autofocus: _autoFocus == true,
            enabled: _enabled,
            keyboardType: _textInputType,
            enableInteractiveSelection: true,
            controller: _inputController,
            readOnly: _readOnly == true,
            textCapitalization: _textCapitalization ?? TextCapitalization.none,
            decoration: _inputDecoration ??
                InputDecoration(
                  contentPadding: const EdgeInsets.all(7.0),
                  prefixIcon: _prefixIcon,
                  suffixIcon: _suffixIcon,
                  labelText: _labelText,
                  helperText: _helperText,
                  filled: _filled,
                  errorText: _mErrorText,
                  border: _border == true ? null : InputBorder.none,
                  counter: _counter,
                ),
            onFieldSubmitted: _onFieldSubmitted,
            onChanged: (text) {
              if (_validators != null) {
                String vError = "";

                for (InputValidator option in _validators!) {
                  if (option.isValid(text) != true) {
                    vError = option.errorText;
                    break;
                  }
                }

                if (vError.isNotEmpty) {
                  _mErrorText = vError;
                  _validationStreamCtrl.sink.add(null);
                } else if (_mErrorText != null) {
                  _mErrorText = null;
                  _validationStreamCtrl.sink.add(null);
                  return;
                }

                if (_valueChange != null) _valueChange!(text);
              }
            },
            onTap: _onTap,
            showCursor: _showCursor,
            obscureText: _obscureText == true,
            inputFormatters: _inputFormatters,
          );
        });
  }
}

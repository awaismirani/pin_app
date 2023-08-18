import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/services/color_services.dart';
import '../helpers/theme_services.dart';

class CustomInputField2 extends StatefulWidget {
  final String? hint;
  final String? label;
  final bool? isPasswordField;
  final TextStyle? textStyle;
  final Function(String? value)? onChange;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
  final Widget? prefix;
  final int? limit;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool? readOnly;
  final Color? fillColor;
  final int? maxLines;
  final int? minLines;
  final String? text;
  final Color? counterColor;
  final bool? showCounter;
  final bool? showBorder;
  final bool? isDense;
  final Key? key;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? margin;
  final String? Function(String?)? validator;
  final Future<String?> Function(String?)? asyncValidator;
  final Widget? suffix;
  final Widget? preffix;

  CustomInputField2(
      {this.hint,
      this.isPasswordField,
      this.onChange,
      this.keyboardType,
      this.prefix,
      this.limit,
      this.controller,
      this.onTap,
      this.readOnly,
      this.fillColor,
      this.maxLines,
      this.text,
      this.showCounter,
      this.counterColor,
      this.showBorder,
      this.minLines,
      this.margin,
      this.suffix,
      this.preffix,
      this.validator,
      this.isDense,
      this.onFieldSubmitted,
      this.asyncValidator,
      this.label,
      this.key,
      this.textStyle,
      this.focusNode})
      : super(key: key);

  final _state = _CustomInputField2State();

  @override
  _CustomInputField2State createState() {
    return _state;
  }

  Future<void> validate() async {
    if (asyncValidator != null) {
      await _state.validate();
    }
  }
}

class _CustomInputField2State extends State<CustomInputField2> {
  late bool _isHidden;
  String text = "";
  bool isPasswordField = false;

  @override
  void initState() {
    isPasswordField = widget.isPasswordField ?? false;
    _isHidden = isPasswordField;
    errorMessage = null;
    if (widget.validator != null && widget.asyncValidator != null) {
      throw "validator and asyncValidator are not allowed at same time";
    }

    if (widget.controller != null && widget.text != null) {
      widget.controller!.text = widget.text!;
    }

    super.initState();
  }

  var isValidating = false;
  var isValid = false;
  var isDirty = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ??
          EdgeInsets.symmetric(
            vertical: 15.0,
          ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          // boxShadow: appBoxShadow1,
        color: ThemeService.isSavedDarkMode() ?  FieldbgColorD : FieldbgColorL,

      ),
      child: TextFormField(
        maxLength: widget.limit,
        key: widget.key,
        onChanged: widget.asyncValidator == null
            ? widget.onChange
            : (value) {
                text = value.toString();
                validateValue(text);
                if (widget.onChange != null) {
                  widget.onChange!(text);
                }
              },
        cursorColor: redColor,
        style:  hintTextStyle.copyWith(
            color: ThemeService.isSavedDarkMode() ? hintTextColorD : hintTextColorL
        ),
        obscureText: _isHidden,
        onTap: widget.onTap,
        validator: widget.validator ??
            (widget.asyncValidator != null
                ? (value) {
                    text = value.toString();
                    return errorMessage;
                  }
                : null),
        maxLines: widget.maxLines ?? 1,
        minLines: widget.minLines,
        readOnly: widget.readOnly ?? false,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        initialValue: widget.controller == null ? widget.text : null,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: widget.focusNode,
        enabled: widget.keyboardType != TextInputType.none,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        buildCounter: widget.showCounter == true
            ? (_, {required currentLength, maxLength, required isFocused}) {
                return Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      currentLength.toString() +
                          (widget.limit != null
                              ? "/" + maxLength.toString()
                              : ""),
                      style: TextStyle(color: widget.counterColor),
                    ),
                  ),
                );
              }
            : null,
        decoration: InputDecoration(
            prefixIcon: widget.prefix,
            prefix: widget.preffix,
            prefixIconConstraints: BoxConstraints(minWidth: 50),
            hintText: widget.hint,
            labelStyle:  hintTextStyle.copyWith(
                color: ThemeService.isSavedDarkMode() ? hintTextColorD : hintTextColorL
            ),
            labelText: widget.label,
            isDense: widget.isDense,
            fillColor: ThemeService.isSavedDarkMode() ?  FieldbgColorD : FieldbgColorL,
            filled: true,
            suffixIconConstraints: BoxConstraints(minWidth: 50),
            suffixIcon: widget.suffix ??
                (isPasswordField
                    ? IconButton(
                        onPressed: () {
                          if (isPasswordField) {
                            if (mounted) {
                              setState(() {
                                _isHidden = !_isHidden;
                              });
                            }
                          }
                        },
                        icon: Visibility(
                          visible: isPasswordField,
                          child: Icon(
                            isPasswordField
                                ? (_isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off)
                                : null,
                            color: ThemeService.isSavedDarkMode()
                                ? hintTextColorD
                                : hintTextColorL,
                          ),
                        ),
                      )
                    : (widget.asyncValidator != null
                        ? _getSuffixIcon()
                        : null)),
            hintStyle:  hintTextStyle.copyWith(
                color: ThemeService.isSavedDarkMode() ? hintTextColorD : hintTextColorL
            ),
            contentPadding:
                EdgeInsets.only(left: 15, right: 10, top: 12, bottom: 12),
            border: (widget.showBorder != null && widget.showBorder == false)
                ? InputBorder.none
                : OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            enabledBorder:
                (widget.showBorder != null && widget.showBorder == false)
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(14)),                      ),
            focusedBorder:
                (widget.showBorder != null && widget.showBorder == false)
                    ? InputBorder.none
                    : OutlineInputBorder(
                  borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      )
            // filled: true,
            // fillColor: Color(0xF0BBBBBB),
            ),
      ),
    );
  }

  Widget _getSuffixIcon() {
    if (isValidating) {
      return Transform.scale(scale: 0.7, child: CupertinoActivityIndicator());
    } else {
      if (!isValid && isDirty) {
        return Icon(
          Icons.cancel,
          color: Colors.red,
          size: 20,
        );
      } else if (isValid) {
        return Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 20,
        );
      } else {
        return SizedBox(
          height: 1,
          width: 1,
        );
      }
    }
  }

  Future<void> validateValue(String newValue) async {
    isDirty = true;
    if (text.isEmpty) {
      if (mounted) {
        setState(() {
          isValid = false;
        });
      }
      return;
    }
    isValidating = true;
    if (mounted) {
      setState(() {});
    }
    errorMessage = await widget.asyncValidator!(newValue);
    isValidating = false;
    isValid = errorMessage == null;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> validate() async {
    await validateValue(text);
  }
}

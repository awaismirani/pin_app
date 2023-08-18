import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_app/helpers/services/color_services.dart';

class CustomButton extends StatefulWidget {
  final Color? color;
  final String text;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final OutlinedBorder? shape;
  final bool? loading;
  final double? elevation;
  final Color? shadowColor;
  final Duration? animationDuration;

  CustomButton(
      {this.color,
        required this.text,
        required this.onPressed,
        this.width,
        this.margin,
        this.height,
        this.textStyle,
        this.shape,
        this.padding,
        this.textAlign,
        this.onLongPressed,
        this.loading,
        this.elevation,
        this.shadowColor,
        this.animationDuration});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        margin: widget.margin ?? EdgeInsets.symmetric(vertical: 20,),
        height: widget.height,
        width: widget.width,
        child: ElevatedButton(
          onLongPress: widget.onLongPressed,
          onPressed: ((widget.loading != null && widget.loading!)) ? null : widget.onPressed,
          style: ElevatedButton.styleFrom(
            padding: widget.padding ?? EdgeInsets.symmetric(vertical: 15,horizontal: 14),
            elevation: widget.elevation,
            shadowColor: widget.shadowColor,
            animationDuration: widget.animationDuration,
            backgroundColor: (widget.color ?? blueColor),
            shape: widget.shape ??
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
          ),
          child: (widget.loading != null && widget.loading == true)
              ? CupertinoActivityIndicator()
              : Text(
            widget.text,
            textAlign: widget.textAlign ?? TextAlign.center,
            style: widget.textStyle ?? buttonTextStyle_bold.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

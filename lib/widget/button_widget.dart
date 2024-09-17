import 'package:flutter/material.dart';
import 'package:storyappsdicoding/utils/styles.dart';

class ButtonWidget extends StatelessWidget {
  final Color? color;
  final double radius;
  final double paddingHorizontal;
  final double paddingVertical;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final Color? borderColor;
  final Color? textColor;
  final String text;
  final FontWeight? fontWeight;
  final Widget? leading;
  final Widget? trailing;

  const ButtonWidget({super.key,
    required this.text,
    required this.radius,
    required this.paddingHorizontal,
    required this.paddingVertical,
    this.onTap,
    this.borderColor,
    this.color,
    this.textColor,
    required this.width,
    required this.height,
    this.fontWeight,
    this.leading,
    this.trailing,
    required MaterialColor backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
          vertical: paddingVertical,
        ),
        decoration: _buildBoxDecoration(),
        child: Row(
          children: [
            if (leading != null) _buildLeading(),
            Expanded(
              child: _buildText(context),
            ),
            if (trailing != null) _buildTrailing(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: color ?? purple,
      border: borderColor != null ? Border.all(color: borderColor!) : null,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  Widget _buildLeading() {
    return leading!;
  }

  Widget _buildText(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? Theme.of(context).colorScheme.onPrimary,
        fontWeight: fontWeight,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTrailing() {
    return trailing!;
  }
}

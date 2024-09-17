import 'package:flutter/material.dart';
import 'package:storyappsdicoding/utils/styles.dart';

class ButtonSubmitWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final Color? textColor;
  final Color? bgColor;
  final double? width;
  final bool? loading;
  final IconData? iconData;

  const ButtonSubmitWidget({
    super.key,
    required this.onPressed,
    required this.title,
    required this.bgColor,
    required this.textColor,
    required this.width,
    required this.iconData,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      onPressed: onPressed,
      disabledColor: Colors.grey.shade400,
      color: bgColor ?? primaryText,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SizedBox(
      width: width ?? 80.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconData != null) _buildIcon(),
          Flexible(
            child: _buildTitle(),
          ),
          if (loading == true) _buildLoadingIndicator(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Icon(
        iconData,
        color: textColor,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title ?? "",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: textColor ?? Colors.grey[800],
        fontSize: 16,
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(textColor!),
        ),
      ),
    );
  }
}

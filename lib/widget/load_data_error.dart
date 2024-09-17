import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyappsdicoding/utils/common.dart';
import 'package:storyappsdicoding/utils/result_state.dart';
import 'package:storyappsdicoding/utils/styles.dart';
import 'button_submit_widget.dart';

class LoadDataError extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color bgColor;
  final Function()? onTap;

  const LoadDataError({
    super.key,
    required this.title,
    required this.subtitle,
    required this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildCircleAvatar(),
            _buildTitle(),
            _buildSubtitle(),
            if (onTap != null) _buildButtonSubmit(context),
          ],
        ),
      ),
    );
  }

  CircleAvatar _buildCircleAvatar() {
    return CircleAvatar(
      foregroundColor: Colors.white,
      backgroundColor: bgColor,
      child: const Text(':('),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      subtitle,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildButtonSubmit(BuildContext context) {
    return ButtonSubmitWidget(
      width: double.infinity,
      title: AppLocalizations.of(context)!.tryAgain,
      bgColor: purple,
      textColor: Colors.white,
      onPressed: onTap!,
      loading: false,
      iconData: null,
    );
  }
}

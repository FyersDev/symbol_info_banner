import 'package:flutter/material.dart';
import 'package:fy_flutter_ui/fy_flutter_ui.dart';

class AlertFieldLabel extends StatefulWidget {
  final String text;
  final String subText;
  const AlertFieldLabel({super.key, required this.text, required this.subText});

  @override
  State<AlertFieldLabel> createState() => _AlertFieldLabelState();
}

class _AlertFieldLabelState extends State<AlertFieldLabel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FyUi.fyText(text: widget.text, textStyle: FyTextStyle.bodyBoldBlack500),
        FyUi.fyText(
            text: " *",
            textStyle:
                FyTextStyle.bodyBoldBlack400.copyWith(color: FyTheme.red200)),
      ],
    );
  }
}

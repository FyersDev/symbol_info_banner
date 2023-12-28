import 'package:create_alert/presenation/devices/helper/alerts_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fy_flutter_ui/fy_flutter_ui.dart';

class AlertsTextFormField extends StatefulWidget {
  final String hintText;
  final bool isFormatRequired;
  final TextEditingController controller;
  const AlertsTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.isFormatRequired});

  @override
  State<AlertsTextFormField> createState() => _AlertsTextFormFieldState();
}

class _AlertsTextFormFieldState extends State<AlertsTextFormField> {
  @override
  Widget build(BuildContext context) {
    return FyUi.fyTextFormField(
      inputFormatters: widget.isFormatRequired
          ? [FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})'))]
          : [],
      autoValidateMode: AutovalidateMode.always,
      validator: (value) {
        if (AlertsHelper.valueError) {
          return 'Please enter valid input';
        }
        return null;
      },
      onChange: (value) {},
      controller: widget.controller,
      maxLines: 1,
      cursorWidth: 2.0,
      enableSuggestions: false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        alignLabelWithHint: false,
        prefixIconConstraints:
            const BoxConstraints(minWidth: 16, minHeight: 48.0),
        prefixIcon: const SizedBox(height: 48.0),
        enabled: true,
        filled: true,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
                color: FyTheme.black100,
                // style: BorderStyle.solid,
                width: 1.5)),
        fillColor: FyColor.black00,
        hintStyle: FyTextStyle.msgSubTitleBold(color: FyColor.black200),
        contentPadding:
            const EdgeInsets.only(left: 16.0, bottom: 16.0, top: 16.0),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: FyTheme.blue400, width: 1.5)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
                color: FyTheme.black100,
                // style: BorderStyle.solid,
                width: 1.5)),
      ),
    );
  }
}

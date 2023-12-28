import 'package:create_alert/presenation/devices/widgets/alert_form.dart';
import 'package:flutter/material.dart';
import 'package:fy_flutter_ui/fy_flutter_ui.dart';

class CreateAlertForm extends StatefulWidget {
  const CreateAlertForm({super.key});

  @override
  State<CreateAlertForm> createState() => _CreateAlertFormState();
}

class _CreateAlertFormState extends State<CreateAlertForm> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: FyTheme.black00,
          alignment: Alignment.center,
          child: const AlertForm()),
    );
  }
}

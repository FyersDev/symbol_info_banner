library create_alert;

import 'package:create_alert/presenation/devices/create_alert_form.dart';

class CreateAlert {
  static final CreateAlert _symbolInfo = CreateAlert._internal();
  CreateAlert._internal();
  factory CreateAlert() {
    return _symbolInfo;
  }

  static CreateAlertForm createAlert() => const CreateAlertForm();
}

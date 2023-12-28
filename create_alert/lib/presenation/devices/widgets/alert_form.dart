import 'package:create_alert/presenation/devices/helper/alerts_helper.dart';
import 'package:create_alert/presenation/devices/widgets/alert_field_label.dart';
import 'package:create_alert/presenation/devices/widgets/alert_note.dart';
import 'package:create_alert/presenation/devices/widgets/alerts_dropdown.dart';
import 'package:create_alert/presenation/devices/widgets/alerts_radio_section.dart';
import 'package:create_alert/presenation/devices/widgets/alerts_textform.dart';
import 'package:flutter/material.dart';
import 'package:fy_flutter_ui/fy_flutter_ui.dart';
import 'package:symbol_master/models/symbol_data_model.dart';

class AlertForm extends StatefulWidget {
  const AlertForm({super.key});

  @override
  State<AlertForm> createState() => _AlertFormState();
}

class _AlertFormState extends State<AlertForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FyPaddingConstants.paddingAll16,
      child: Column(children: [
        const AlertFieldLabel(text: "Type", subText: "*"),
        const SizedBox(
          height: 20,
        ),
        AlertsDropDown(
          dropdownValue: AlertsHelper.dropdownTypeValue,
          initialDropdown: "Last traded price",
          dropDownType: 'Type',
          dropdownData: AlertsHelper().alertTypeData,
          dropDownIndex: AlertsHelper.dropdownIndexType,
        ),
        const SizedBox(
          height: 20,
        ),
        const AlertFieldLabel(text: "Condition", subText: "*"),
        const SizedBox(
          height: 25,
        ),
        AlertsDropDown(
          dropdownValue: AlertsHelper.dropdownConditionValue,
          initialDropdown: "Greater than",
          dropDownType: 'Condition',
          dropdownData: AlertsHelper().conditionData,
          dropDownIndex: AlertsHelper.dropdownIndexCondition,
        ),
        const SizedBox(
          height: 25,
        ),
        const AlertsRadioSection(),
        const SizedBox(
          height: 25,
        ),
        const AlertFieldLabel(text: "Value", subText: "*"),
        const SizedBox(
          height: 25,
        ),
        AlertsTextFormField(
          isFormatRequired: true,
          hintText: "Eg: 150.75",
          controller: AlertsHelper.alertValueController,
        ),
        const SizedBox(
          height: 25,
        ),
        const AlertFieldLabel(text: "Name", subText: "*"),
        const SizedBox(
          height: 25,
        ),
        AlertsTextFormField(
          isFormatRequired: false,
          hintText: "Alert Name",
          controller: AlertsHelper.alertNameController,
        ),
        const SizedBox(
          height: 25,
        ),
        const AlertNote(),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: FyUi.fyPrimaryButton(
              text: "Create Alert",
              onPressed: () {
                if (checkValidations()) {
                  return;
                }
                AlertsHelper.createAlert(
                    context, SymbolDataModel.fromMap({'symbol': "NSE:TCS-EQ"}));
              },
              fyButtonSize: FyButtonSize.medium),
        ),
      ]),
    );
  }

  checkValidations() {
    if (AlertsHelper.alertNameController.text.isEmpty) {
      AlertsHelper.valueError = true;
    } else {
      AlertsHelper.valueError = false;
    }
    if (AlertsHelper.alertValueController.text.isEmpty) {
      AlertsHelper.nameError = true;
    } else {
      AlertsHelper.nameError = false;
    }
    setState(() {});
    return AlertsHelper.nameError || AlertsHelper.valueError;
  }
}

import 'package:create_alert/presenation/devices/helper/alerts_helper.dart';
import 'package:flutter/material.dart';
import 'package:fy_flutter_ui/fy_flutter_ui.dart';

class AlertsRadioSection extends StatefulWidget {
  const AlertsRadioSection({super.key});

  @override
  State<AlertsRadioSection> createState() => _AlertsRadioSectionState();
}

class _AlertsRadioSectionState extends State<AlertsRadioSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FyUi.fyRadio(
            onSelect: (value) => {
                  if (value.name != "Price")
                    {AlertsHelper.priceRadioEnabled = false}
                },
            textStyle: FyTextStyle.bodyBoldBlack500,
            fyRadioPosition: FyRadioPosition.row,
            fyRadioSize: FyRadioSize.large,
            fyRadioList: [
              FyRadioLists(name: "Price", index: 1, isChecked: true),
              FyRadioLists(name: "% of last traded price", index: 2),
            ],
            radioItem: "Price"),
      ],
    );
  }
}

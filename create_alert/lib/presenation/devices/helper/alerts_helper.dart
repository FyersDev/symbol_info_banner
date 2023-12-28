import 'package:create_alert/presenation/devices/modals/dropdown_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fy_data_feeds/logic/fy_data_feeds/bloc/fy_data_feeds_bloc.dart';
import 'package:flutter_fy_data_feeds/logic/fy_data_feeds/functions/fy_data_feeds_helper.dart';
import 'package:symbol_master/models/symbol_data_model.dart';

class AlertsHelper {
  late ValueNotifier<bool> rebuilder = ValueNotifier(true);

  static ValueNotifier<int> dropdownIndexType = ValueNotifier(0);
  static ValueNotifier<int> dropdownIndexCondition = ValueNotifier(0);
  static ValueNotifier<String> dropdownTypeValue = ValueNotifier("");
  static ValueNotifier<String> dropdownConditionValue = ValueNotifier("");
  static TextEditingController alertValueController = TextEditingController();
  static TextEditingController alertNameController = TextEditingController();
  static bool valueError = false;
  static bool nameError = false;
  static bool priceRadioEnabled = true;

  static validator() {
    if (valueError) {
      return 'Please enter valid input';
    }
    return null;
  }

  final List<DropdownItems> conditionData = [
    DropdownItems(index: 0, label: "Greater than >"),
    DropdownItems(index: 1, label: "Greater than or equal to >="),
    DropdownItems(index: 2, label: "Less than <"),
    DropdownItems(index: 3, label: "Less than or equal to <="),
    DropdownItems(index: 4, label: "Equals =="),
  ];

  final List<DropdownItems> alertTypeData = [
    DropdownItems(index: 0, label: "Last traded price"),
    DropdownItems(index: 1, label: "Open"),
    DropdownItems(index: 2, label: "High"),
    DropdownItems(index: 3, label: "Low"),
    DropdownItems(index: 4, label: "Close"),
    DropdownItems(index: 5, label: "Volume"),
    DropdownItems(index: 6, label: "Day change"),
    DropdownItems(index: 7, label: "Day change percent"),
    DropdownItems(index: 8, label: "Avergae trade price"),
    DropdownItems(index: 9, label: "Intra day change"),
    DropdownItems(index: 10, label: "Intra day change percent"),
    DropdownItems(index: 11, label: "Volume traded today"),
    DropdownItems(index: 12, label: "Total buy quantity"),
    DropdownItems(index: 13, label: "Total sell quantity"),
  ];

  static void createAlert(BuildContext context, SymbolDataModel symbol) {
    String value = '0';
    double symbolLtp = 0;
    if (AlertsHelper.priceRadioEnabled) {
      value = AlertsHelper.alertValueController.text;
    } else {
      try {
        symbolLtp = FyDataFeedsBloc().getSymbolData(symbol.zipInfo).ltp;
      } catch (err) {}
      value = (symbolLtp +
              ((double.parse(AlertsHelper.alertValueController.text) / 100) *
                  symbolLtp))
          .toStringAsFixed(2);
    }

    // BlocProvider.of<AlertsCubit>(context).createAlert(
    //     alertDetails: AlertDetails(
    //         status: 3,
    //         name: AlertsHelper.alertNameController.text,
    //         notes: AlertsHelper.alertNameController.text,
    //         comparisonType: "comparisonType",
    //         condition: "condition",
    //         type: "type",
    //         id: "id",
    //         value: value,
    //         symbolMaster: symbol));
  }
}

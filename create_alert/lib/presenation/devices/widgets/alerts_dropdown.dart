import 'package:create_alert/constants/defines/images/image_constants.dart';
import 'package:create_alert/presenation/devices/modals/dropdown_data.dart';
import 'package:create_alert/presenation/devices/widgets/alerts_dropdown_list.dart';
import 'package:flutter/material.dart';
import 'package:fy_flutter_ui/fy_flutter_ui.dart';

class AlertsDropDown extends StatefulWidget {
  final String initialDropdown;
  final String dropDownType;
  final List<DropdownItems> dropdownData;
  final ValueNotifier<String> dropdownValue;
  final ValueNotifier<int> dropDownIndex;
  const AlertsDropDown(
      {super.key,
      required this.initialDropdown,
      required this.dropDownType,
      required this.dropdownData,
      required this.dropdownValue,
      required this.dropDownIndex});

  @override
  State<AlertsDropDown> createState() => _AlertsDropDownState();
}

class _AlertsDropDownState extends State<AlertsDropDown> {
  double scrollableFilterHeight = 56.0;

  showDropDownBottomSheet(BuildContext context, String route) {
    showModalBottomSheet(
        context: context,
        routeSettings: RouteSettings(name: route),
        builder: (BuildContext context) {
          return AlertDropdownList(
            dropdownValue: widget.dropdownValue,
            dropdownType: widget.dropDownType,
            onTap: (index) {
              widget.dropDownIndex.value = index;
            },
            conditionData: widget.dropdownData,
            dropDownInex: widget.dropDownIndex,
          );
        });
  }

  @override
  void initState() {
    widget.dropdownValue.value = widget.initialDropdown;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDropDownBottomSheet(context, "");
      },
      child: Container(
        height: scrollableFilterHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                  color: FyTheme.black300, blurRadius: 0.1, spreadRadius: 0)
            ],
            color: FyTheme.black00),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                      valueListenable: widget.dropdownValue,
                      builder: (context, value, _) {
                        return Flexible(
                          child: Text(
                            value,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: FyTextStyle.bodyBlack500,
                          ),
                        );
                      }),
                ],
              ),
              const SizedBox(width: 4),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: FyUi.fyImage(
                      image: ImageConstants.arrowDownIcon,
                      color: FyTheme.black500D200,
                      height: 14,
                      width: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

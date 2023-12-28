import 'package:create_alert/constants/defines/images/image_constants.dart';
import 'package:create_alert/presenation/devices/modals/dropdown_data.dart';
import 'package:flutter/material.dart';
import 'package:fy_flutter_ui/fy_flutter_ui.dart';

class AlertDropdownList extends StatefulWidget {
  final Function(int) onTap;
  final List<DropdownItems> conditionData;
  final String dropdownType;
  final ValueNotifier<String> dropdownValue;
  final ValueNotifier<int> dropDownInex;
  const AlertDropdownList(
      {super.key,
      required this.onTap,
      required this.conditionData,
      required this.dropdownType,
      required this.dropdownValue,
      required this.dropDownInex});

  @override
  State<AlertDropdownList> createState() => _AlertDropdownListState();
}

class _AlertDropdownListState extends State<AlertDropdownList> {
  int selectedIndex = 0;
  final ScrollController scrollController = ScrollController();
  _bottomSheetNoutch(Color? color) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Container(
        width: 36,
        height: 3,
        decoration: BoxDecoration(
            color: color ?? FyColor.black100,
            borderRadius: BorderRadius.circular(1.5)),
      ),
    );
  }

  @override
  void initState() {
    selectedIndex = widget.dropDownInex.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: _bottomSheetNoutch(FyColor.black100)),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 14, bottom: 14),
          child: Row(
            children: [
              FyUi.fyImage(
                image: ImageConstants.calendar,
                height: 18,
                width: 18,
              ),
              const SizedBox(width: 4),
              Text(
                widget.dropdownType,
                style: FyTextStyle.buttonSmallBlack500,
              ),
            ],
          ),
        ),
        FyUi.fyDivider(
          thickness: 1,
          // dividerColor: FyColor.tagLightColor(context),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            child: ValueListenableBuilder(
                valueListenable: widget.dropDownInex,
                builder: (context, index, _) {
                  return Column(
                    children: [
                      ListView.separated(
                        itemCount: widget.conditionData.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              selectedIndex = index;
                              widget.dropDownInex.value = index;
                              widget.onTap.call(index);
                              widget.dropdownValue.value =
                                  widget.conditionData[index].label;
                              Navigator.pop(context);
                            },
                            child: Container(
                              color: index == selectedIndex
                                  ? FyTheme.blue100
                                  : FyTheme.black00,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.conditionData[index].label,
                                      style: FyTextStyle.buttonMediumBBlue500
                                          .copyWith(
                                        color: index == selectedIndex
                                            ? FyTheme.blue500
                                            : FyTheme.black400,
                                      ),
                                    ),
                                    if (index == selectedIndex)
                                      FyUi.fyImage(
                                        image: ImageConstants.checked,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return FyUi.fyDivider(
                            thickness: 0.5,
                            // dividerColor: FyColor.tagLightColor(context),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }
}

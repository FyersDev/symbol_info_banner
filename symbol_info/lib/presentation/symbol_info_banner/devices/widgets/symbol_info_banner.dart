import 'package:flutter/material.dart';
import 'package:fy_flutter_ui/fy_flutter_ui.dart';
import 'package:symbol_info/constants/defines/images/image_constants.dart';
import 'package:symbol_master/cubit/icon_master_cubit.dart';
import 'package:symbol_master/models/symbol_data_model.dart';

class SymbolInfoBanner extends StatefulWidget {
  final SymbolDataModel? symbol;
  final String comingFrom;
  const SymbolInfoBanner({super.key, this.symbol, required this.comingFrom});

  @override
  State<SymbolInfoBanner> createState() => _SymbolInfoBannerState();
}

class _SymbolInfoBannerState extends State<SymbolInfoBanner> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: FyTheme.blue100,
        child: Padding(
          padding: FyPaddingConstants.paddingAll12,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      color: FyTheme.black300, blurRadius: 0.1, spreadRadius: 0)
                ],
                color: FyTheme.black00),
            child: Padding(
              padding: FyPaddingConstants.paddingAll10,
              child: Row(
                children: [
                  FyUi.fyImage(
                      image: "https://public.fyers.in/icons/icons_nse/TCS.png",
                      height: 60,
                      width: 60),
                  const SizedBox(height: 20),
                  Flexible(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                              child: FyUi.fyText(
                                  text: widget.symbol != null
                                      ? widget.symbol!.zipInfo.shortName
                                      : "TCS-EQ",
                                  textStyle: FyTextStyle.h2Black500)),
                          Padding(
                            padding: FyPaddingConstants.paddingAll8,
                            child: FyUi.fyText(
                              text: "NSE",
                              textStyle: FyTextStyle.bodyBlack400,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                              child: FyUi.fyText(
                            text: "Tata consultancy Ltd.",
                            textStyle: FyTextStyle.tinyBodyBoldBlack400,
                          ))
                        ],
                      )
                    ],
                  )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          FyUi.fyText(
                              text: widget.symbol != null
                                  ? widget.symbol!.zipInfo.shortName
                                  : "43.25",
                              textStyle: FyTextStyle.bodyBoldBlack500),
                          Padding(
                            padding: FyPaddingConstants.paddingAll6,
                            child: FyUi.fyImage(
                                image: 43.25 > 0
                                    ? ImageConstants.arrowUpIcon
                                    : ImageConstants.arrowDownIcon),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FyUi.fyText(
                              text: "-2.35 ( 3.23 )",
                              textStyle: FyTextStyle.bodyBlack400
                                  .copyWith(color: Colors.red)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

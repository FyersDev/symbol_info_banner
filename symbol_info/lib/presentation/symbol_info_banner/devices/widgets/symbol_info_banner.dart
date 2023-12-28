import 'package:flutter/material.dart';
import 'package:flutter_fy_data_feeds/presentation/widgets/fy_data_feeds_builder.dart';
import 'package:flutter_fy_data_feeds/presentation/widgets/fy_data_feeds_subscriber.dart';
import 'package:fy_flutter_ui/fy_flutter_ui.dart';
import 'package:symbol_info/constants/defines/images/image_constants.dart';
import 'package:symbol_master/cubit/icon_master_cubit.dart';
import 'package:symbol_master/models/symbol_data_model.dart';

class SymbolInfoBanner extends StatefulWidget {
  final String? symbol;
  final String comingFrom;
  const SymbolInfoBanner({super.key, this.symbol, required this.comingFrom});

  @override
  State<SymbolInfoBanner> createState() => _SymbolInfoBannerState();
}

class _SymbolInfoBannerState extends State<SymbolInfoBanner> {
  @override
  void initState() {
    super.initState();
  }

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
                      image: IconMasterCubit().getIconURL(
                          iconName: widget.symbol!, iconType: IconType.symbol),
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
                                      ? SymbolDataModel.fromMap(
                                              {'symbol': widget.symbol})
                                          .zipInfo
                                          .shortName
                                      : "",
                                  textStyle: FyTextStyle.h2Black500)),
                          Padding(
                            padding: FyPaddingConstants.paddingAll8,
                            child: FyUi.fyText(
                              text: SymbolDataModel.fromMap(
                                  {'symbol': widget.symbol}).zipInfo.exchange,
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
                            text: SymbolDataModel.fromMap(
                                {'symbol': widget.symbol}).zipInfo.details,
                            textStyle: FyTextStyle.tinyBodyBoldBlack400,
                          ))
                        ],
                      )
                    ],
                  )),
                  FyDataFeedsBuilder(
                      symbol: SymbolDataModel.fromMap({'symbol': widget.symbol})
                          .zipInfo,
                      child: (symbol) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                FyUi.fyText(
                                    text: widget.symbol != null
                                        ? symbol.ltp!.toString()
                                        : "0",
                                    textStyle: FyTextStyle.bodyBoldBlack500),
                                Padding(
                                  padding: FyPaddingConstants.paddingAll6,
                                  child: FyUi.fyImage(
                                      image: symbol.chp > 0
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
                                    text: symbol.ch.toString(),
                                    textStyle: symbol.chp > 0
                                        ? FyTextStyle.bodyBlack400
                                            .copyWith(color: Colors.green)
                                        : FyTextStyle.bodyBlack400
                                            .copyWith(color: Colors.red)),
                              ],
                            )
                          ],
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

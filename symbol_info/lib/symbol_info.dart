library symbol_info;

import 'package:flutter/material.dart';
import 'package:symbol_info/presentation/symbol_info_banner/devices/widgets/symbol_info_banner.dart';
import 'package:symbol_master/models/symbol_data_model.dart';

/// A Calculator.
class SymbolInfo {
  static final SymbolInfo _symbolInfo = SymbolInfo._internal();
  SymbolInfo._internal();
  factory SymbolInfo() {
    return _symbolInfo;
  }

  static SymbolInfoBanner symbolInfoBanner(
          {required SymbolDataModel? symbol, required String comingFrom}) =>
      SymbolInfoBanner(
        comingFrom: comingFrom,
        symbol: symbol,
      );
}

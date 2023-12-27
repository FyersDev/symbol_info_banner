library symbol_info;

import 'package:flutter/material.dart';
import 'package:symbol_info/presentation/symbol_info_banner/devices/widgets/symbol_info_banner.dart';
import 'package:symbol_master/models/symbol_data_model.dart';

/// A Calculator.
class SymbolInfo {
  static Widget displaySymbolInfoBanner(
      SymbolDataModel symbol, String comingFrom) {
    return SymbolInfoBanner(comingFrom: "", symbol: symbol);
  }
}

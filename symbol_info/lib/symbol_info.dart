library symbol_info;

import 'package:symbol_info/presentation/symbol_info_banner/devices/widgets/symbol_info_banner.dart';

/// A Calculator.
class SymbolInfo {
  static final SymbolInfo _symbolInfo = SymbolInfo._internal();
  SymbolInfo._internal();
  factory SymbolInfo() {
    return _symbolInfo;
  }

  static SymbolInfoBanner symbolInfoBanner(
          {String? symbol, String? comingFrom}) =>
      SymbolInfoBanner(
        comingFrom: comingFrom!,
        symbol: symbol,
      );
}

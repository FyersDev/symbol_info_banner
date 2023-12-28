import 'package:config/cubit/config_cubit.dart';

class AlertEndpoints {
  //ALERTS MODULE
  static String alerts =
      ConfigCubit().getUrl(moduleName: "alerts", urlKey: "alerts_get") ??
          "https://api.fyers.in/api/v2/price-alert";
  static String toggleAlerts =
      ConfigCubit().getUrl(moduleName: "alerts", urlKey: "alerts_toggle") ??
          "https://api.fyers.in/api/v2/toggle-alert";
  static String trendingAlerts =
      ConfigCubit().getUrl(moduleName: "alerts", urlKey: "alerts_trending") ??
          "https://api.fyers.in/api/v2/trending-alert";
}

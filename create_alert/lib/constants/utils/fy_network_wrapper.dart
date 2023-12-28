import 'package:fy_flutter_service/service/network/model/network_response.dart';

class FyNetworkWrapper {
  bool authValidator(FyResponse response) {
    if (response.type == ResponseType.authError) {
      // SSOBloc().relogin();
      return true;
    }
    return true;
  }
}

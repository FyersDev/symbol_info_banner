class SSOBloc {
  static final SSOBloc instance = SSOBloc._internal();
  factory SSOBloc() => instance;
  SSOBloc._internal() : super();

  String accessToken = "";

  String get token => "";
}

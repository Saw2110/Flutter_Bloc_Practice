import 'package:firstapp_bloc/model/user_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<UserModel> fetchCovidList() {
    return _provider.fetchUserList();
  }
}

class NetworkError extends Error {}

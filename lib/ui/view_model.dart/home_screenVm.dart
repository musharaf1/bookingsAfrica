import 'package:bookingsAfricaApp/core/enum/view_state.dart';
import 'package:bookingsAfricaApp/core/models/user.dart';
import 'package:bookingsAfricaApp/core/provider_model/base_provider_model.dart';
import 'package:bookingsAfricaApp/network_services/home_service.dart';

import '../../locator.dart';

class HomeScreenVM extends BaseProviderModel {
  final _api = locator<HomeApi>();

  List<UserModel> _userList = [];
  List<String> imageList = [
    'assets/images/trav2.jpg',
    'assets/images/large3.jpg',
    'assets/images/nature.jpg',
    'assets/images/people.jpg',
    'assets/images/large.jpg',
    'assets/images/trav3.jpg',
  ];

  Future<void> getUserList() async {
    setViewState(ViewState.BUSY);
    _userList = await _api.getUserList();
    setViewState(ViewState.IDLE);
    print(_userList);
    notifyListeners();
  }

  List<UserModel> get userList => _userList;
  void searchProducts(String query) {
    if (query.isNotEmpty) {
      _userList = _userList
          .where((user) =>
              user.first_name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      notifyListeners();
    } else {
      getUserList();
    }
  }
}

import 'package:election_flutter_app/model/Logout.dart';

class LogoutContractView {
  setLogoutData(Logout logout){}
  setOnErrorLogout(error){}
}

class LogoutContractPresenter {
  getLogoutData(String nik, String password){}
  loadLogoutData(String nik, String password){}
}
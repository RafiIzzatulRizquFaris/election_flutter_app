import 'package:election_flutter_app/model/Login.dart';

class LoginContractPresenter{
  getLoginData (String email, String password){}
  loadLoginData (String email, String password){}
}

class LoginContractView{
  setLoginData (Login login){}
  onErrorLogin (error){}
}

// abstract class LoginContractView{
//   setLoginData (List value){}
//   onErrorLogin (String error){}
// }
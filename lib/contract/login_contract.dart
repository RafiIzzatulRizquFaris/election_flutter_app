abstract class LoginContractPresenter{
  getLoginData (String email, String password){}
  loadLoginData (String email, String password){}
}

abstract class LoginContractView{
  setLoginData (List value){}
  onErrorLogin (String error){}
}
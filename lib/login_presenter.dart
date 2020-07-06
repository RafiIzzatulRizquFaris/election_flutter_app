import 'package:election_flutter_app/login_contract.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPresenter implements LoginContractPresenter{

  LoginContractView _loginContractView;
  LoginPresenter(this._loginContractView);

  @override
  loadLoginData(String email, String password){
    getLoginData(email, password).then((value) => _loginContractView.setLoginData(value));
  }

  @override
  Future<String> getLoginData(String email, String password) async{
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser firebaseUser = authResult.user;
    return firebaseUser.uid;
  }

}
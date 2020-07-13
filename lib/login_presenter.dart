import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:election_flutter_app/login_contract.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPresenter implements LoginContractPresenter {
  LoginContractView _loginContractView;

  LoginPresenter(this._loginContractView);

  @override
  loadLoginData(String email, String password) {
    getLoginData(email, password)
        .then((value) => _loginContractView.setLoginData(value))
        .catchError((err) => _loginContractView.onErrorLogin(err.toString()));
  }

  @override
  Future<List> getLoginData(String email, String password) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final Firestore _firestore = Firestore.instance;

    AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser firebaseUser = authResult.user;
    QuerySnapshot snapshot = await _firestore
        .collection('user')
        .where("iduser", isEqualTo: firebaseUser.uid)
        .getDocuments();
    bool chosen = snapshot.documents[0].data["chosen"];
    print(chosen);
    return [firebaseUser.uid, chosen];
  }
}

import 'package:election_flutter_app/model/Check.dart';

class CheckViewContract{
  onSuccessCheckData(Check check){}
  onErrorCheckData(error){}
}

class CheckPresenterContract{
  getCheckData(String nik, String password){}
  loadData(String nik, String password){}
}
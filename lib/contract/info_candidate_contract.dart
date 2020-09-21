import 'package:cloud_firestore/cloud_firestore.dart';

abstract class InfoCandidateContractPresenter{
  getInfoCandidate(){}
  loadData(){}
}

abstract class InfoCandidateContractView{
  setInfoCandidate(List<DocumentSnapshot> value){}
  setOnErrorInfoCandidate(String error){}
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:election_flutter_app/info_candidate_contract.dart';

class InfoCandidatePresenter implements InfoCandidateContractPresenter {
  InfoCandidateContractView _infoCandidateContractView;

  InfoCandidatePresenter(this._infoCandidateContractView);

  @override
  Future<List> getInfoCandidate() async {
    Firestore firestore = Firestore.instance;
    QuerySnapshot snapshot =
        await firestore.collection("candidate").getDocuments();
    return snapshot.documents;
  }

  @override
  loadData() {
    getInfoCandidate()
        .then((value) => _infoCandidateContractView.setInfoCandidate(value))
        .catchError((error) =>
            _infoCandidateContractView.setOnErrorInfoCandidate(error));
  }
}

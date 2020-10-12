import 'package:election_flutter_app/model/DataCandidate.dart';

class Candidate {
    List<DataCandidate> data_candidate;
    String message;
    String status;

    Candidate({this.data_candidate, this.message, this.status});

    factory Candidate.fromJson(Map<String, dynamic> json) {
        return Candidate(
            data_candidate: json['data_candidate'] != null ? (json['data_candidate'] as List).map((i) => DataCandidate.fromJson(i)).toList() : null, 
            message: json['message'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        if (this.data_candidate != null) {
            data['data_candidate'] = this.data_candidate.map((v) => v.toJson()).toList();
        }
        return data;
    }
}
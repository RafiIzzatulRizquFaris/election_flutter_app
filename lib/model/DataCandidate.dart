class DataCandidate {
    String desc_candidate;
    String id_candidate;
    String img_candidate;
    String name_candidate;

    DataCandidate({this.desc_candidate, this.id_candidate, this.img_candidate, this.name_candidate});

    factory DataCandidate.fromJson(Map<String, dynamic> json) {
        return DataCandidate(
            desc_candidate: json['desc_candidate'], 
            id_candidate: json['id_candidate'], 
            img_candidate: json['img_candidate'], 
            name_candidate: json['name_candidate'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['desc_candidate'] = this.desc_candidate;
        data['id_candidate'] = this.id_candidate;
        data['img_candidate'] = this.img_candidate;
        data['name_candidate'] = this.name_candidate;
        return data;
    }
}
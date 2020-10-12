class Data {
    String code_voter;
    String id_voter;
    String ischosen;
    String islogin;
    String nik_voter;
    String password_voter;

    Data({this.code_voter, this.id_voter, this.ischosen, this.islogin, this.nik_voter, this.password_voter});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            code_voter: json['code_voter'],
            id_voter: json['id_voter'], 
            ischosen: json['ischosen'], 
            islogin: json['islogin'], 
            nik_voter: json['nik_voter'], 
            password_voter: json['password_voter'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code_voter'] = this.code_voter;
        data['id_voter'] = this.id_voter;
        data['ischosen'] = this.ischosen;
        data['islogin'] = this.islogin;
        data['nik_voter'] = this.nik_voter;
        data['password_voter'] = this.password_voter;
        return data;
    }
}
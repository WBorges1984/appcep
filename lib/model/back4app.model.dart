class Back4AppModel {
  List<CepBack4App> cep4App = [];

  Back4AppModel(this.cep4App);

  Back4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      cep4App = <CepBack4App>[];
      json['results'].forEach((v) {
        cep4App.add(CepBack4App.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = cep4App.map((v) => v.toJson()).toList();
    return data;
  }
}

class CepBack4App {
  String objectId = "";
  String createdAt = "";
  String updatedAt = "";
  String logradouro = "";
  String bairro = "";
  String cidade = "";
  String uf = "";
  String nrCep = "";

  CepBack4App(this.objectId, this.createdAt, this.updatedAt, this.logradouro,
      this.bairro, this.cidade, this.uf, this.nrCep);

  CepBack4App.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    uf = json['uf'];
    nrCep = json['nr_cep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['logradouro'] = logradouro;
    data['bairro'] = bairro;
    data['cidade'] = cidade;
    data['uf'] = uf;
    data['nr_cep'] = nrCep;
    return data;
  }
}

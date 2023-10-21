class Backs4AppModel {
  List<Back4AppModel> cep4App = [];

  Backs4AppModel(this.cep4App);

  Backs4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      cep4App = <Back4AppModel>[];
      json['results'].forEach((v) {
        cep4App.add(Back4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = cep4App.map((v) => v.toJson()).toList();
    return data;
  }
}

class Back4AppModel {
  String objectId = "";
  String createdAt = "";
  String updatedAt = "";
  String logradouro = "";
  String bairro = "";
  String cidade = "";
  String uf = "";
  String nrCep = "";

  Back4AppModel(
      {required this.objectId,
      required this.createdAt,
      required this.updatedAt,
      required this.logradouro,
      required this.bairro,
      required this.cidade,
      required this.uf,
      required this.nrCep});

  factory Back4AppModel.fromMap(Map<String, dynamic> map) {
    return Back4AppModel(
        objectId: map['objectId'] ?? '',
        createdAt: map['createdAt'] ?? '',
        updatedAt: map['updatedAt'] ?? '',
        logradouro: map['logradouro'] ?? '',
        bairro: map['bairro'] ?? '',
        cidade: map['cidade'] ?? '',
        uf: map['uf'] ?? '',
        nrCep: map['nrCep'] ?? '');
  }

  Back4AppModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'] ?? '';
    createdAt = json['createdAt'] ?? '';
    updatedAt = json['updatedAt'] ?? '';
    logradouro = json['logradouro'] ?? '';
    bairro = json['bairro'] ?? '';
    cidade = json['cidade'] ?? '';
    uf = json['uf'] ?? '';
    nrCep = json['nr_cep'] ?? '';
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

  Map<String, dynamic> toJsonEndpoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['logradouro'] = logradouro;
    data['bairro'] = bairro;
    data['cidade'] = cidade;
    data['uf'] = uf;
    data['nr_cep'] = nrCep;
    return data;
  }
}

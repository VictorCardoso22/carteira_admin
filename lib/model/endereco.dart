/// cep : "5712000"
/// logradouro : "5712000"
/// bairro : "Cruzeiro do sul"
/// numero : "12"
/// complemento : "perto do sao domingos"

class Endereco {
  Endereco({
      String? cep, 
      String? logradouro, 
      String? bairro, 
      String? numero, 
      String? complemento,}){
    _cep = cep;
    _logradouro = logradouro;
    _bairro = bairro;
    _numero = numero;
    _complemento = complemento;
}

  Endereco.fromJson(dynamic json) {
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _bairro = json['bairro'];
    _numero = json['numero'];
    _complemento = json['complemento'];
  }
  String? _cep;
  String? _logradouro;
  String? _bairro;
  String? _numero;
  String? _complemento;
Endereco copyWith({  String? cep,
  String? logradouro,
  String? bairro,
  String? numero,
  String? complemento,
}) => Endereco(  cep: cep ?? _cep,
  logradouro: logradouro ?? _logradouro,
  bairro: bairro ?? _bairro,
  numero: numero ?? _numero,
  complemento: complemento ?? _complemento,
);
  String? get cep => _cep;
  String? get logradouro => _logradouro;
  String? get bairro => _bairro;
  String? get numero => _numero;
  String? get complemento => _complemento;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cep != null) {
      map['cep'] = _cep;
    }

    if (_logradouro != null) {
      map['logradouro'] = _logradouro;
    }

    if (_bairro != null) {
      map['bairro'] = _bairro;
    }

    if (_numero != null) {
      map['numero'] = _numero;
    }

    if (_complemento != null) {
      map['complemento'] = _complemento;
    }
    return map;
  }

}
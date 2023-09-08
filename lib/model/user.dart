import 'package:admin/model/endereco.dart';
/// cpf : "01"
/// dataNascimento : "01-07-2022"
/// email : ""
/// endereço : ""
/// faculdadeAnexo : ""
/// nome : ""
/// nomeCompleto : ""
/// numeroMatriculaFaculdade : ""
/// rg : ""
/// rgAnexo : ""

class UserModel {

  UserModel({
      this.cpf,
      this.curso,
      this.instituicao,
      this.dataNascimento, 
      this.email, 
      this.endereco,
      this.nome, 
      this.nomeCompleto, 
      this.numeroMatriculaFaculdade, 
      this.rg,
      this.rgEmissor,
      this.rgFrenteAnexo,
      this.rgVersoAnexo,
      this.declaracaoEscolarAnexo,
      this.comprovanteResidenciaAnexo,
      this.turno,
      this.fotoAnexo,
      this.ativo,
      this.timeStampCriacao,
      this.validade,
    this.admin = false,

  });

  UserModel.fromJson(dynamic json) {
    cpf = json['cpf'];
    dataNascimento = json['dataNascimento'];
    email = json['email'];
    try {
      endereco = Endereco.fromJson(json['endereço']);
    } catch(e){
      endereco = Endereco(numero: "",bairro: "",logradouro: "",cep: "",complemento: "");
    }
    nome = json['nome'];
    nomeCompleto = json['nomeCompleto'];
    numeroMatriculaFaculdade = json['numeroMatriculaFaculdade'];
    rg = json['rg'];
    rgEmissor = json['rgEmissor'];
    rgFrenteAnexo = json['rgFrenteAnexo'];
    rgVersoAnexo = json['rgVersoAnexo'];
    curso = json['curso'];
    turno = json['turno'];
    fotoAnexo = json['fotoAnexo'];
    declaracaoEscolarAnexo = json['declaracaoEscolarAnexo'];
    comprovanteResidenciaAnexo = json['comprovanteResidenciaAnexo'];
    instituicao = json['instituicao'];
    ativo = json['ativo'];
    timeStampCriacao = json['timeStampCriacao'];
    validade = json['validade'];
    admin = json['admin'] ?? false;

    
  }

  String? cpf;
  String? curso;
  String? dataNascimento;
  String? email;
  Endereco? endereco;
  bool admin = false;
  String? nome;
  String? nomeCompleto;
  String? numeroMatriculaFaculdade;
  String? rg;
  String? rgEmissor;
  String? rgFrenteAnexo;
  String? rgVersoAnexo;
  String? fotoAnexo;
  String? declaracaoEscolarAnexo;
  String? comprovanteResidenciaAnexo;
  String? instituicao;
  List? turno;
  bool? ativo;
  String? timeStampCriacao;
  String? validade;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (cpf != null) {
      map['cpf'] = cpf;
    }

    if (dataNascimento != null) {
      map['dataNascimento'] = dataNascimento;
    }

    if (email != null) {
      map['email'] = email;
    }

    if (endereco != null) {
      map['endereço'] = endereco!.toJson();
    }

    if (nome != null) {
      map['nome'] = nome;
    }

    if (nomeCompleto != null) {
      map['nomeCompleto'] = nomeCompleto;
    }

    if (numeroMatriculaFaculdade != null) {
      map['numeroMatriculaFaculdade'] = numeroMatriculaFaculdade;
    }

    if (rg != null) {
      map['rg'] = rg;
    }

    if (rgFrenteAnexo != null) {
      map['rgFrenteAnexo'] = rgFrenteAnexo;
    }

    if (rgVersoAnexo != null) {
      map['rgVersoAnexo'] = rgVersoAnexo;
    }

    if (curso != null) {
      map['curso'] = curso;
    }

    if (turno != null) {
      map['turno'] = turno;
    }

    if (fotoAnexo != null) {
      map['fotoAnexo'] = fotoAnexo;
    }

    if (declaracaoEscolarAnexo != null) {
      map['declaracaoEscolarAnexo'] = declaracaoEscolarAnexo;
    }

    if (comprovanteResidenciaAnexo != null) {
      map['comprovanteResidenciaAnexo'] = comprovanteResidenciaAnexo;
    }

    if (instituicao != null) {
      map['instituicao'] = instituicao;
    }

    if (ativo != null) {
      map['ativo'] = ativo;
    }

    if (timeStampCriacao != null) {
      map['timeStampCriacao'] = timeStampCriacao;
    }

    if (validade != null) {
      map['validade'] = validade;
    }
    map['admin'] = admin;

    return map;
  }

}
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

  String? cpf;
  String? curso;
  String? dataNascimento;
  String? email;
  String? endereco;
  String? faculdadeAnexo;
  String? nome;
  String? nomeCompleto;
  String? numeroMatriculaFaculdade;
  String? rg;
  String? rgFrenteAnexo;
  String? rgVersoAnexo;
  String? fotoAnexo;
  String? declaracaoEscolarAnexo;
  String? comprovanteResidenciaAnexo;
  String? instituicao;
  bool? ativo;
  List? turno;

  UserModel({
      this.cpf,
      this.curso,
      this.instituicao,
      this.dataNascimento, 
      this.email, 
      this.endereco,
      this.faculdadeAnexo, 
      this.nome, 
      this.nomeCompleto, 
      this.numeroMatriculaFaculdade, 
      this.rg, 
      this.rgFrenteAnexo,
      this.rgVersoAnexo,
      this.declaracaoEscolarAnexo,
      this.comprovanteResidenciaAnexo,
      this.turno,
      this.fotoAnexo,
      this.ativo,
  });

  UserModel.fromJson(dynamic json) {
    cpf = json['cpf'];
    dataNascimento = json['dataNascimento'];
    email = json['email'];
    endereco = json['endereco'];
    faculdadeAnexo = json['faculdadeAnexo'];
    nome = json['nome'];
    nomeCompleto = json['nomeCompleto'];
    numeroMatriculaFaculdade = json['numeroMatriculaFaculdade'];
    rg = json['rg'];
    rgFrenteAnexo = json['rgFrenteAnexo'];
    rgVersoAnexo = json['rgVersoAnexo'];
    curso = json['curso'];
    turno = json['turno'];
    fotoAnexo = json['fotoAnexo'];
    declaracaoEscolarAnexo = json['declaracaoEscolarAnexo'];
    comprovanteResidenciaAnexo = json['comprovanteResidenciaAnexo'];
    instituicao = json['instituicao'];
    ativo = json['ativo'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cpf'] = cpf;
    map['dataNascimento'] = dataNascimento;
    map['email'] = email;
    map['endereço'] = endereco;
    map['faculdadeAnexo'] = faculdadeAnexo;
    map['nome'] = nome;
    map['nomeCompleto'] = nomeCompleto;
    map['numeroMatriculaFaculdade'] = numeroMatriculaFaculdade;
    map['rg'] = rg;
    map['rgFrenteAnexo'] = rgFrenteAnexo;
    map['rgVersoAnexo'] = rgVersoAnexo;
    map['curso'] = curso;
    map['turno'] = turno;
    map['fotoAnexo'] = fotoAnexo;
    map['declaracaoEscolarAnexo'] = declaracaoEscolarAnexo ;
    map['comprovanteResidenciaAnexo'] = comprovanteResidenciaAnexo ;
    map['instituicao'] = instituicao;
    map['ativo'] = ativo;

    return map;
  }

}
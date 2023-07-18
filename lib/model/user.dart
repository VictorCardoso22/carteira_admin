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
    endereco = json['endereco'];

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
    timeStampCriacao = json['timeStampCriacao'];
    validade = json['validade'];
    admin = json['admin'] ?? false;
  }

  String? cpf;
  String? curso;
  String? dataNascimento;
  String? email;
  String? endereco;

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
  List? turno;
  bool? ativo;
  bool admin = false;
  String? timeStampCriacao;
  String? validade;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cpf'] = cpf;
    map['dataNascimento'] = dataNascimento;
    map['email'] = email;
    map['endereco'] = endereco;
    map['nome'] = nome;
    map['nomeCompleto'] = nomeCompleto;
    map['numeroMatriculaFaculdade'] = numeroMatriculaFaculdade;
    map['rg'] = rg;
    map['rgFrenteAnexo'] = rgFrenteAnexo;
    map['rgVersoAnexo'] = rgVersoAnexo;
    map['curso'] = curso;
    map['turno'] = turno;
    map['fotoAnexo'] = fotoAnexo;
    map['declaracaoEscolarAnexo'] = declaracaoEscolarAnexo;
    map['comprovanteResidenciaAnexo'] = comprovanteResidenciaAnexo;
    map['instituicao'] = instituicao;
    map['ativo'] = ativo;
    map['timeStampCriacao'] = timeStampCriacao;
    map['validade'] = validade;
    map['admin'] = admin;

    return map;
  }
}

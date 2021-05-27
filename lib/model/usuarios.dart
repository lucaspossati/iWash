import 'dart:convert';

String usuariosParaJson(Usuarios data)=> json.encode(data.toJson());

class Usuarios {
  int _id;
  Null _imagePerfil;
  String _primeiroNome;
  String _sobrenome;
  String _email;
  String _endereco;
  String _numero;
  String _bairro;
  String _cidade;
  String _estado;
  String _cEP;
  String _cPF;
  String _login;
  String _senha;
  Null _sexo;
  Null _latitude;
  Null _longitude;
  String _datadeNascimento;
  String _dataCriacao;
  String _dataAlteracao;

  Usuarios(
      {int id,
      Null imagePerfil,
      String primeiroNome,
      String sobrenome,
      String email,
      String endereco,
      String numero,
      String bairro,
      String cidade,
      String estado,
      String cEP,
      String cPF,
      String login,
      String senha,
      Null sexo,
      Null latitude,
      Null longitude,
      String datadeNascimento,
      String dataCriacao,
      String dataAlteracao}) {
    this._id = id;
    this._imagePerfil = imagePerfil;
    this._primeiroNome = primeiroNome;
    this._sobrenome = sobrenome;
    this._email = email;
    this._endereco = endereco;
    this._numero = numero;
    this._bairro = bairro;
    this._cidade = cidade;
    this._estado = estado;
    this._cEP = cEP;
    this._cPF = cPF;
    this._login = login;
    this._senha = senha;
    this._sexo = sexo;
    this._latitude = latitude;
    this._longitude = longitude;
    this._datadeNascimento = datadeNascimento;
    this._dataCriacao = dataCriacao;
    this._dataAlteracao = dataAlteracao;
  }

  int get id => _id;
  set id(int id) => _id = id;
  Null get imagePerfil => _imagePerfil;
  set imagePerfil(Null imagePerfil) => _imagePerfil = imagePerfil;
  String get primeiroNome => _primeiroNome;
  set primeiroNome(String primeiroNome) => _primeiroNome = primeiroNome;
  String get sobrenome => _sobrenome;
  set sobrenome(String sobrenome) => _sobrenome = sobrenome;
  String get email => _email;
  set email(String email) => _email = email;
  String get endereco => _endereco;
  set endereco(String endereco) => _endereco = endereco;
  String get numero => _numero;
  set numero(String numero) => _numero = numero;
  String get bairro => _bairro;
  set bairro(String bairro) => _bairro = bairro;
  String get cidade => _cidade;
  set cidade(String cidade) => _cidade = cidade;
  String get estado => _estado;
  set estado(String estado) => _estado = estado;
  String get cEP => _cEP;
  set cEP(String cEP) => _cEP = cEP;
  String get cPF => _cPF;
  set cPF(String cPF) => _cPF = cPF;
  String get login => _login;
  set login(String login) => _login = login;
  String get senha => _senha;
  set senha(String senha) => _senha = senha;
  Null get sexo => _sexo;
  set sexo(Null sexo) => _sexo = sexo;
  Null get latitude => _latitude;
  set latitude(Null latitude) => _latitude = latitude;
  Null get longitude => _longitude;
  set longitude(Null longitude) => _longitude = longitude;
  String get datadeNascimento => _datadeNascimento;
  set datadeNascimento(String datadeNascimento) =>
      _datadeNascimento = datadeNascimento;
  String get dataCriacao => _dataCriacao;
  set dataCriacao(String dataCriacao) => _dataCriacao = dataCriacao;
  String get dataAlteracao => _dataAlteracao;
  set dataAlteracao(String dataAlteracao) => _dataAlteracao = dataAlteracao;

  Usuarios.fromJson(Map<String, dynamic> json) {
    _id = json['Id'];
    _imagePerfil = json['ImagePerfil'];
    _primeiroNome = json['PrimeiroNome'];
    _sobrenome = json['Sobrenome'];
    _email = json['Email'];
    _endereco = json['Endereco'];
    _numero = json['Numero'];
    _bairro = json['Bairro'];
    _cidade = json['Cidade'];
    _estado = json['Estado'];
    _cEP = json['CEP'];
    _cPF = json['CPF'];
    _login = json['Login'];
    _senha = json['Senha'];
    _sexo = json['Sexo'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    _datadeNascimento = json['DatadeNascimento'];
    _dataCriacao = json['DataCriacao'];
    _dataAlteracao = json['DataAlteracao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this._id;
    data['ImagePerfil'] = this._imagePerfil;
    data['PrimeiroNome'] = this._primeiroNome;
    data['Sobrenome'] = this._sobrenome;
    data['Email'] = this._email;
    data['Endereco'] = this._endereco;
    data['Numero'] = this._numero;
    data['Bairro'] = this._bairro;
    data['Cidade'] = this._cidade;
    data['Estado'] = this._estado;
    data['CEP'] = this._cEP;
    data['CPF'] = this._cPF;
    data['Login'] = this._login;
    data['Senha'] = this._senha;
    data['Sexo'] = this._sexo;
    data['Latitude'] = this._latitude;
    data['Longitude'] = this._longitude;
    data['DatadeNascimento'] = this._datadeNascimento;
    data['DataCriacao'] = this._dataCriacao;
    data['DataAlteracao'] = this._dataAlteracao;
    return data;
  }
}
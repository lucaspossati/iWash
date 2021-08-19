class Endereco {
  int id;
  String titulo;
  String rua;
  int numero;
  String bairro;
  String cidade;
  String estado;
  String complemento;
  String pontoReferencia;
  String cEP;
  String latitude;
  String longitude;
  int usuariosId;
  String dataCriacao;
  String dataAlteracao;
  String usuarios;

  Endereco(
      {this.id,
      this.titulo,
      this.rua,
      this.numero,
      this.bairro,
      this.cidade,
      this.estado,
      this.complemento,
      this.pontoReferencia,
      this.cEP,
      this.latitude,
      this.longitude,
      this.usuariosId,
      this.dataCriacao,
      this.dataAlteracao,
      this.usuarios});

  Endereco.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    titulo = json['Titulo'];
    rua = json['Rua'];
    numero = json['Numero'];
    bairro = json['Bairro'];
    cidade = json['Cidade'];
    estado = json['Estado'];
    complemento = json['Complemento'];
    pontoReferencia = json['PontoReferencia'];
    cEP = json['CEP'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    usuariosId = json['UsuariosId'];
    dataCriacao = json['DataCriacao'];
    dataAlteracao = json['DataAlteracao'];
    usuarios = json['Usuarios'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Titulo'] = this.titulo;
    data['Rua'] = this.rua;
    data['Numero'] = this.numero;
    data['Bairro'] = this.bairro;
    data['Cidade'] = this.cidade;
    data['Estado'] = this.estado;
    data['Complemento'] = this.complemento;
    data['PontoReferencia'] = this.pontoReferencia;
    data['CEP'] = this.cEP;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['UsuariosId'] = this.usuariosId;
    data['DataCriacao'] = this.dataCriacao;
    data['DataAlteracao'] = this.dataAlteracao;
    data['Usuarios'] = this.usuarios;
    return data;
  }
}
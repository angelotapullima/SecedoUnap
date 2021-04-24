


class AfiliadosModel {
  String idPersona;
  String idTipoPersonaDtipoPersona;
  String idFacultadDfacultad;
  String codigo;
  String nombrePersona;
  String apellidoPaterno;
  String apellidoMaterno;
  String direccion;
  String telefono;
  String celular;
  String correo;
  String imagen;
  String nvecesPersona;
  String fechaNombramiento;
  String dni;
  String cuentaBN;
  String fechaNac;
  String tipoPersona;
  String tipoAfiliado;
  String facultad;
  String idAfiliacion;
  String idPersonaDpersona;
  String fechaAfiliacion;
  String fechaCesantia;
  String nveces;
  String fechaDesafiliacion;
  String nombreCompleto;

  AfiliadosModel({
    this.idPersona,
    this.idTipoPersonaDtipoPersona,
    this.idFacultadDfacultad,
    this.codigo,
    this.nombrePersona,
    this.apellidoPaterno,
    this.apellidoMaterno,
    this.direccion,
    this.telefono,
    this.celular,
    this.correo,
    this.imagen,
    this.nvecesPersona,
    this.fechaNombramiento,
    this.dni,
    this.cuentaBN,
    this.fechaNac,
    this.tipoPersona,
    this.tipoAfiliado,
    this.facultad,
    this.idAfiliacion,
    this.idPersonaDpersona,
    this.fechaAfiliacion,
    this.fechaCesantia,
    this.nveces,
    this.fechaDesafiliacion,
    this.nombreCompleto,
  });

  factory AfiliadosModel.fromJson(Map<String, dynamic> json) => AfiliadosModel(
        idPersona: json["idPersona"],
        idTipoPersonaDtipoPersona: json["idTipoPersonaDtipoPersona"],
        idFacultadDfacultad: json["idFacultadDfacultad"],
        codigo: json["codigo"],
        nombrePersona: json["nombrePersona"],
        apellidoPaterno: json["apellidoPaterno"],
        apellidoMaterno: json["apellidoMaterno"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        celular: json["celular"],
        correo: json["correo"],
        imagen: json["imagen"],
        nvecesPersona: json["nvecesPersona"],
        fechaNombramiento: json["fechaNombramiento"],
        dni: json["dni"],
        cuentaBN: json["cuentaBN"],
        fechaNac: json["fechaNac"],
        tipoPersona: json["tipoPersona"],
        tipoAfiliado: json["tipoAfiliado"],
        facultad: json["facultad"],
        idAfiliacion: json["idAfiliacion"],
        idPersonaDpersona: json["idPersonaDpersona"],
        fechaAfiliacion: json["fechaAfiliacion"],
        fechaCesantia: json["fechaCesantia"],
        nveces: json["nveces"],
        fechaDesafiliacion: json["fechaDesafiliacion"],
        nombreCompleto: json["nombreCompleto"],
      );
}

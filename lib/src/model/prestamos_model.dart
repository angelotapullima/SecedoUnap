class PrestamosModel {
  String cheque;
  String fSolicitud;
  String solicitado;
  String fAprobado;
  String aprobado;
  String girar;
  String tInteres;
  String nCuotas;
  String tipo;
  String prioridad;
  String garante;
  String idPrestamo;
  String idPersona;


  String montoPagado;
  String montoPorPagar;
  String porcentajePagado;
  String porcentajeSinPagar;

  PrestamosModel(
      {this.cheque,
      this.fSolicitud,
      this.solicitado,
      this.fAprobado,
      this.aprobado,
      this.girar,
      this.tInteres,
      this.nCuotas,
      this.tipo,
      this.prioridad,
      this.garante,
      this.idPrestamo,
      this.idPersona});

  factory PrestamosModel.fromJson(Map<String, dynamic> json) => PrestamosModel(
        cheque: json["cheque"],
        fSolicitud: json["fSolicitud"],
        solicitado: json["solicitado"],
        fAprobado: json["fAprobado"],
        aprobado: json["aprobado"],
        girar: json["girar"],
        tInteres: json["tInteres"],
        nCuotas: json["nCuotas"],
        tipo: json["tipo"],
        prioridad: json["prioridad"],
        garante: json["garante"],
        idPrestamo: json["idPrestamo"],
        idPersona: json["idPersona"],
      );
}

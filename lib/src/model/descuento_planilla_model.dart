class DescuentoPlanillaModel {
  String? idDescuentoPlanilla;
  String? idAfiliacion;
  String? codigo;
  String? nombre;
  String? fecha;
  String? cesantia;
  String? funeral;
  String? jubilacion;
  String? otros;
  String? multa;
  String? apr;
  String? garantizado;
  String? descuento;
  String? ntotal;
  String? aplicado;
  String? diferencia;
  String? idPersona;
  String? posicion;

  DescuentoPlanillaModel(
      {this.idDescuentoPlanilla,
      this.idAfiliacion,
      this.codigo,
      this.nombre,
      this.fecha,
      this.cesantia,
      this.funeral,
      this.jubilacion,
      this.otros,
      this.multa,
      this.apr,
      this.garantizado,
      this.descuento,
      this.ntotal,
      this.aplicado,
      this.diferencia,
      this.idPersona,
      this.posicion});

  factory DescuentoPlanillaModel.fromJson(Map<String, dynamic> json) =>
      DescuentoPlanillaModel(
        idDescuentoPlanilla: json["idDescuentoPlanilla"],
        idAfiliacion: json["idAfiliacion"],
        codigo: json["codigo"],
        nombre: json["nombre"],
        fecha: json["fecha"],
        cesantia: json["cesantia"],
        funeral: json["funeral"],
        jubilacion: json["jubilacion"],
        otros: json["otros"],
        multa: json["multa"],
        apr: json["apr"],
        garantizado: json["garantizado"],
        descuento: json["descuento"],
        ntotal: json["ntotal"],
        aplicado: json["aplicado"],
        diferencia: json["diferencia"],
        idPersona: json["idPersona"],
        posicion: json["posicion"],
      );
}

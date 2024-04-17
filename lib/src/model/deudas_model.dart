class DeudasModel {
  String? idPersona;
  String? idAfiliacion;
  String? codigo;
  String? nombre;
  String? cesantia;
  String? funeral;
  String? jubilacion;
  String? multa;
  String? apr;
  String? capital;
  String? interes;
  String? garantizado;
  String? descuento;

  String? estadoDeuda;
  String? fechaAtual;

  DeudasModel({
    this.idPersona,
    this.idAfiliacion,
    this.codigo,
    this.nombre,
    this.cesantia,
    this.funeral,
    this.jubilacion,
    this.multa,
    this.apr,
    this.capital,
    this.interes,
    this.garantizado,
    this.descuento,
    this.estadoDeuda,
    this.fechaAtual,
  });

  factory DeudasModel.fromJson(Map<String, dynamic> json) => DeudasModel(
        idPersona: json["idPersona"],
        idAfiliacion: json["idAfiliacion"],
        codigo: json["codigo"],
        nombre: json["nombre"],
        cesantia: json["cesantia"],
        funeral: json["funeral"],
        jubilacion: json["jubilacion"],
        multa: json["multa"],
        apr: json["apr"],
        capital: json["capital"],
        interes: json["interes"],
        garantizado: json["garantizado"],
        descuento: json["descuento"],
        fechaAtual: json["fechaAtual"],
      );
}

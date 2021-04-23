class PlanillaEnviadaModel {
  String idPlanillaEnviada;
  String idAfiliacion;
  String tipoPlanilla;
  String fecha;
  String cesantia;
  String funeral;
  String jubilacion;
  String multa;
  String apr;
  String garantizado;
  String descuento;
  String total;

  String fechaOriginal;

  PlanillaEnviadaModel({
    this.idPlanillaEnviada,
    this.idAfiliacion,
    this.tipoPlanilla,
    this.fecha,
    this.cesantia,
    this.funeral,
    this.jubilacion,
    this.multa,
    this.apr,
    this.garantizado,
    this.descuento,
    this.total,
    this.fechaOriginal,
  });


  factory PlanillaEnviadaModel.fromJson(Map<String, dynamic> json) => PlanillaEnviadaModel(
        idPlanillaEnviada: json["idPlanillaEnviada"],
        idAfiliacion: json["idAfiliacion"],
        tipoPlanilla: json["tipoPlanilla"],
        fecha: json["fecha"],
        cesantia: json["cesantia"],
        funeral: json["funeral"],
        jubilacion: json["jubilacion"],
        multa: json["multa"],
        apr: json["apr"],
        garantizado: json["garantizado"],
        descuento: json["descuento"],
        total: json["total"],
      );
}

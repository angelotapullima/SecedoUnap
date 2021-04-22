class CuotasPrestamosModel {
  String idCuota;
  String idPrestamo;
  String vencimiento;
  String monto;
  String fpago;
  String pagado;
  String principal;
  String interes;
  String cuota;

  String posicion;
  String estadoPagado;

  CuotasPrestamosModel({
    this.idCuota,
    this.idPrestamo,
    this.vencimiento,
    this.monto,
    this.fpago,
    this.pagado,
    this.principal,
    this.interes,
    this.cuota,
    this.posicion,
    this.estadoPagado,
  });

  factory CuotasPrestamosModel.fromJson(Map<String, dynamic> json) =>
      CuotasPrestamosModel(
        idCuota: json["idCuota"],
        idPrestamo: json["idPrestamo"],
        vencimiento: json["vencimiento"],
        monto: json["monto"],
        fpago: json["fpago"],
        pagado: json["pagado"],
        principal: json["principal"],
        interes: json["interes"],
        cuota: json["cuota"],
        posicion: json["posicion"],
        estadoPagado: json["estadoPagado"],
      );
}

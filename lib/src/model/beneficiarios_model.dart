class BeneficiariosModel {
  String? idBeneficiario;
  String? idPersona;
  String? nombre;
  String? gradoParentesco;
  String? porcentaje;
  String? funeral;
  String? beneficioFallecimiento;
  String? fallecido;
  String? idGradoParentesco;
  String? defuncion;
  String? cartaDeclaratoria;
  String? observaciones;

  BeneficiariosModel({
    this.idBeneficiario,
    this.idPersona,
    this.nombre,
    this.gradoParentesco,
    this.porcentaje,
    this.funeral,
    this.beneficioFallecimiento,
    this.fallecido,
    this.idGradoParentesco,
    this.defuncion,
    this.cartaDeclaratoria,
    this.observaciones,
  });

  factory BeneficiariosModel.fromJson(Map<String, dynamic> json) =>
      BeneficiariosModel(
        idBeneficiario: json["idBeneficiario"],
        idPersona: json["idPersona"],
        nombre: json["nombre"],
        gradoParentesco: json["gradoParentesco"],
        porcentaje: json["porcentaje"],
        funeral: json["funeral"],
        beneficioFallecimiento: json["beneficioFallecimiento"],
        fallecido: json["fallecido"],
        idGradoParentesco: json["idGradoParentesco"],
        defuncion: json["defuncion"],
        cartaDeclaratoria: json["cartaDeclaratoria"],
        observaciones: json["observaciones"],
      );
}

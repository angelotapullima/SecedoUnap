import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static Database _database;
  static final DatabaseProvider db = DatabaseProvider._();

  DatabaseProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'secedo.db');

    Future _onConfigure(Database db) async {
      await db.execute('PRAGMA foreign_keys = ON');
    }

    return await openDatabase(path,
        version: 1,
        onOpen: (db) {},
        onConfigure: _onConfigure, onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Prestamos ('
          ' idPrestamo TEXT  PRIMARY KEY,'
          ' cheque TEXT,'
          ' fSolicitud TEXT,'
          ' solicitado TEXT,'
          ' fAprobado TEXT,'
          ' aprobado TEXT,'
          ' girar TEXT,'
          ' tInteres TEXT,'
          ' nCuotas TEXT,'
          ' tipo TEXT,'
          ' prioridad TEXT,'
          ' garante TEXT,'
          ' fechaActualizado TEXT,'
          ' idPersona TEXT'
          ')');

      await db.execute('CREATE TABLE CuotasPrestamo ('
          ' idCuota TEXT  PRIMARY KEY,'
          ' idPrestamo TEXT,'
          ' vencimiento TEXT,'
          ' monto TEXT,'
          ' fpago TEXT,'
          ' pagado TEXT,'
          ' principal TEXT,'
          ' interes TEXT,'
          ' posicion TEXT,'
          ' estadoPagado TEXT,'
          ' cuota TEXT'
          ')');

      await db.execute('CREATE TABLE DescuentoPlanilla ('
          ' idDescuentoPlanilla TEXT  PRIMARY KEY,'
          ' idAfiliacion TEXT,'
          ' codigo TEXT,'
          ' nombre TEXT,'
          ' fecha TEXT,'
          ' cesantia TEXT,'
          ' funeral TEXT,'
          ' jubilacion TEXT,'
          ' otros TEXT,'
          ' multa TEXT,'
          ' apr TEXT,'
          ' garantizado TEXT,'
          ' descuento TEXT,'
          ' ntotal TEXT,'
          ' aplicado TEXT,'
          ' diferencia TEXT,'
          ' idPersona TEXT,'
          ' posicion TEXT'
          ')');

      await db.execute('CREATE TABLE Beneficiarios ('
          ' idBeneficiario TEXT  PRIMARY KEY,'
          ' idPersona TEXT,'
          ' nombre TEXT,'
          ' gradoParentesco TEXT,'
          ' porcentaje TEXT,'
          ' funeral TEXT,'
          ' beneficioFallecimiento TEXT,'
          ' fallecido TEXT,'
          ' idGradoParentesco TEXT,'
          ' defuncion TEXT,'
          ' cartaDeclaratoria TEXT,'
          ' observaciones TEXT'
          ')');

      await db.execute('CREATE TABLE PlanillaEnviada ('
          ' idPlanillaEnviada TEXT  PRIMARY KEY,'
          ' idAfiliacion TEXT,'
          ' tipoPlanilla TEXT,'
          ' fecha TEXT,'
          ' cesantia TEXT,'
          ' funeral TEXT,'
          ' jubilacion TEXT,'
          ' multa TEXT,'
          ' apr TEXT,'
          ' garantizado TEXT,'
          ' descuento TEXT,'
          ' total TEXT'
          ')');

           await db.execute('CREATE TABLE Afiliados ('
          ' idPersona TEXT  PRIMARY KEY,'
          ' idTipoPersonaDtipoPersona TEXT,'
          ' idFacultadDfacultad TEXT,'
          ' codigo TEXT,'
          ' nombrePersona TEXT,'
          ' apellidoPaterno TEXT,'
          ' apellidoMaterno TEXT,'
          ' direccion TEXT,'
          ' telefono TEXT,'
          ' celular TEXT,'
          ' correo TEXT,'
          ' imagen TEXT,'
          ' nvecesPersona TEXT,'
          ' fechaNombramiento TEXT,'
          ' dni TEXT,'
          ' cuentaBN TEXT,'
          ' fechaNac TEXT,'
          ' tipoPersona TEXT,'
          ' tipoAfiliado TEXT,'
          ' facultad TEXT,'
          ' idAfiliacion TEXT,'
          ' idPersonaDpersona TEXT,'
          ' fechaAfiliacion TEXT,'
          ' fechaCesantia TEXT,'
          ' nveces TEXT,'
          ' fechaDesafiliacion TEXT'
          ')');

       
    });
  }
}

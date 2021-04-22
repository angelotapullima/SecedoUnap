





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

    final path = join(documentsDirectory.path, 'secedo2.db');

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

     
     
   
   

    });
  }
}




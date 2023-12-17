import 'dart:async';
import 'package:sqflite/sqflite.dart';
//import 'package:collection/collection.dart'; // ´Enecess´ario adicionar a respetiva dependencia
import 'package:path/path.dart'; // É necessário adicionar a respetiva dependencia

class Basededados {
  static const nomebd = "bdadm.db";
  final int versao = 1;
  static Database? _basededados;
//---------------------------------------
  Future<Database> get basededados async {
    if (_basededados != null) return _basededados!;
    _basededados = await _initDatabase();
    return _basededados!;
  }

//---------------------------------------
  _initDatabase() async {
    String path = join(await getDatabasesPath(), nomebd);
    return await openDatabase(path, version: versao, onCreate: _onCreate);
  }

//---------------------------------------
  Future _onCreate(Database db, int version) async {}
//---------------------------------------
  Future<void> criatabela() async {
    Database db = await basededados;
    await db.execute('''
CREATE TABLE pessoas (
id INTEGER PRIMARY KEY AUTOINCREMENT,
nome TEXT,
password text,
email text,
datanasci text,
naturalidade text,
nacionalidade text
)
''');
  }

//---------------------------------------
  Future<void> apagatabela() async {
    Database db = await basededados;
    await db.execute('''
Drop TABLE pessoas
''');
  }

//---------------------------------------
  Future<void> inserirvalor(nom, pass, email) async {
    Database db = await basededados;
    await db.rawInsert(
        'insert into pessoas(nome,password,email,datanasci,naturalidade,nacionalidade) values("$nom","$pass","$email"');
  }

  Future<void> deletePessoa(id) async {
    Database db = await basededados;
    await db.rawDelete('DELETE FROM pessoas WHERE id = $id');
  }

//---------------------------------------
  Future<void> consulta1() async {
    Database db = await basededados;
    List<Map> resultado = await db.rawQuery('select id, nome from pessoas');
    resultado.forEach((linha) {
      print(linha);
    });
  }

  Future<List<Map<String, String>>> Login() async {
    List<Map<String, String>> users = [];
    Database db = await basededados;
    List<Map<String, Object?>> resultado =
        await db.rawQuery('select email, password from pessoas');
    resultado.forEach((linha) {
      users.add({
        'email': linha['email'].toString(),
        'password': linha['password'].toString(),
      });
    });
    return users;
  }

  Future<List<String>> consulta() async {
    List<String> uts = [];
    Database db = await basededados;
    List<Map<String, Object?>> resultado =
        await db.rawQuery('select nome from pessoas');
    resultado.forEach((linha) {
      uts.add(linha['nome'].toString());
    });
    return uts;
  }
}

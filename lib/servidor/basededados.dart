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

Future<void> CriarTabelaTipoParcerias() async {
  Database db = await basededados;
  await db.execute('''
    CREATE TABLE tipo_parceria (
      id_tipo_parceria INTEGER PRIMARY KEY AUTOINCREMENT,
      tipo_parceria INTEGER
    )
  ''');
}

Future<void> CriarTabelaParcerias() async {
  Database db = await basededados;
  await db.execute('''
    CREATE TABLE parcerias (
      id_parceria INTEGER PRIMARY KEY AUTOINCREMENT,
      id_tipo_parceria INTEGER,
      nome_parceria TEXT,
      descricao_parceria TEXT,
      beneficios_parceria TEXT,
      imagem_parceria TEXT,
      parceria_publicada BOOL,
      FOREIGN KEY (id_tipo_parceria) REFERENCES tipo_parceria(id_tipo_parceria)
    )
  ''');
}



Future<void> inserirParceria(String nomeParceria, int idTipoParceria, String descricaoParceria, String beneficiosParceria, String imagemParceria, bool parceriaPublicada) async {
  Database db = await basededados;
  await db.rawInsert('''
    INSERT INTO parcerias (
      nome_parceria,
      id_tipo_parceria,
      descricao_parceria,
      beneficios_parceria,
      imagem_parceria,
      parceria_publicada
    ) VALUES (
      "$nomeParceria",
      $idTipoParceria,
      "$descricaoParceria",
      "$beneficiosParceria",
      "$imagemParceria",
      ${parceriaPublicada ? 1 : 0}
    )
  ''');
  print(nomeParceria);
}



  Future<List<String>> AdicionarParceriasBD() async {
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

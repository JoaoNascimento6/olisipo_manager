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
      tipo_parceria TEXT
    )
  ''');
  }

  Future<void> InsertTipoParceria(tipo_parceria) async {
    Database db = await basededados;
    for (final tiposParcerias in tipo_parceria) {
      await db.rawInsert(
          'insert into tipo_parceria(tipo_parceria) values("$tiposParcerias")');
      print(tiposParcerias);
    }
  }

  Future<List<String>> MostrarTipoParcerias() async {
    List<String> uts = [];
    Database db = await basededados;
    List<Map<String, Object?>> resultado =
        await db.rawQuery('select tipo_parceria from tipo_parceria');
    resultado.forEach((linha) {
      uts.add(linha['tipo_parceria'].toString());
    });
    return uts;
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

  Future<void> inserirParceria(List<dynamic> parceriaData) async {
    Database db = await basededados;

    for (final data in parceriaData) {
      await db.rawInsert('''
      INSERT INTO parcerias (
        nome_parceria,
        id_tipo_parceria,
        descricao_parceria,
        beneficios_parceria,
        imagem_parceria,
        parceria_publicada
      ) VALUES (
        "${data['nomeParceria']}",
        ${data['idTipoParceria']},
        "${data['descricaoParceria']}",
        "${data['beneficiosParceria']}",
        "${data['imagemParceria']}",
        ${data['parceriaPublicada'] ? 1 : 0}
      )
    ''');
      print(data['nomeParceria']);
    }
  }

  Future<List<List<dynamic>>> MostrarParcerias() async {
    List<List<dynamic>> uts = [];
    Database db = await basededados;
    List<Map<String, Object?>> resultado = await db.rawQuery(
        'select nome_parceria, id_tipo_parceria, descricao_parceria, beneficios_parceria, imagem_parceria, parceria_publicada from parcerias');
    resultado.forEach((linha) {
      List<dynamic> parceria = [
        linha['nome_parceria'].toString(),
        linha['id_tipo_parceria'],
        linha['descricao_parceria'].toString(),
        linha['beneficios_parceria'].toString(),
        linha['imagem_parceria'].toString(),
        linha['parceria_publicada'],
      ];
      uts.add(parceria);
    });
    return uts;
  }

  Future<List<List<dynamic>>> MostrarNoticias() async {
    List<List<dynamic>> nts = [];
    Database db = await basededados;
    List<Map<String, Object?>> resultado = await db.rawQuery(
        'select id_noticia, id_tipo_noticia, titulo_noticia, subtitulo_noticia, corpo_noticia, imagem_noticia,tipo_noticia from noticias');
    resultado.forEach((linha) {
      List<dynamic> noticia = [
        linha['id_noticia'].toString(),
        linha['id_tipo_noticia'],
        linha['titulo_noticia'].toString(),
        linha['subtitulo_noticia'].toString(),
        linha['corpo_noticia'].toString(),
        linha['imagem_noticia'],
        linha['tipo_noticia'].toString()
      ];
      nts.add(noticia);
    });
    return nts;
  }
}

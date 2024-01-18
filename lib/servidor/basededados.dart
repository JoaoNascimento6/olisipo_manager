// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:sqflite/sqflite.dart';
//import 'package:collection/collection.dart'; // ´Enecess´ario adicionar a respetiva dependencia
import 'package:path/path.dart'; // É necessário adicionar a respetiva dependencia

// _____________________________________ Base de dados SQlite ____________________________________
class Basededados {
  static const nomebd = "bdadm.db";
  final int versao = 2;
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
  Future<void> apagatabelaParcerias() async {
    Database db = await basededados;
    await db.execute('Delete from tipo_parceria');
  }

  Future<void> apagatabelaTipoParcerias() async {
    Database db = await basededados;
    await db.execute('''
Drop TABLE tipo_parceria
''');
  }

//__________________________

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

// _____________________________________ TIPO PARCERIAS ____________________________________
  Future<void> CriarTabelaTipoParcerias() async {
    Database db = await basededados;
    await db.execute('''
    CREATE TABLE IF NOT EXISTS tipo_parceria (
      id_tipo_parceria INTEGER PRIMARY KEY AUTOINCREMENT,
      tipo_parceria TEXT
    )
  ''');
  }

  Future<void> InsertTipoParceria(tipoParc) async {
    Database db = await basededados;
    await db.delete('tipo_parceria');
    for (final tiposParcerias in tipoParc) {
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

//____________________parcerias
  Future<void> CriarTabelaParcerias() async {
    Database db = await basededados;
    await db.execute('''
    CREATE TABLE IF NOT EXISTS parcerias (
      id_parceria INTEGER PRIMARY KEY AUTOINCREMENT,
      nome_parceria TEXT,
      descricao_parceria TEXT,
      beneficios_parceria TEXT,
      imagem_parceria TEXT,
      tipo_parceria TEXT
    )
  ''');
  }

  Future<void> inserirParceria(
      List<(String, String, String, String, String)> parceriaData) async {
    Database db = await basededados;

    await db.delete('parcerias');

    for (final (
          imagem_parceria,
          nome_parceria,
          descricao_parceria,
          beneficios_parceria,
          tipo_parceria
        ) in parceriaData) {
      await db.rawInsert(
          ' INSERT INTO parcerias ( imagem_parceria, nome_parceria,descricao_parceria,beneficios_parceria,tipo_parceria) VALUES (?,?,?,?,?)',
          [
            imagem_parceria,
            nome_parceria,
            descricao_parceria,
            beneficios_parceria,
            tipo_parceria
          ]);
      print(nome_parceria);
    }
  }

  Future<
      (
        List<(String, String, String, String, String)>,
        List<String>,
      )> MostrarParcerias() async {
    List<(String, String, String, String, String)> parcerias = [];
    List<String> tipos = [];

    Database db = await basededados;
    List<Map<String, Object?>> resultado = await db.rawQuery(
        'select imagem_parceria, nome_parceria, descricao_parceria, beneficios_parceria, tipo_parceria from parcerias');
    resultado.forEach((linha) {
      parcerias.add((
        linha['imagem_parceria'].toString(),
        linha['nome_parceria'].toString(),
        linha['descricao_parceria'].toString(),
        linha['beneficios_parceria'].toString(),
        linha['tipo_parceria'].toString()
      ));
    });

    List<Map<String, Object?>> resultadoTipo =
        await db.rawQuery('select tipo_parceria from tipo_parceria');
    resultadoTipo.forEach((linha) {
      tipos.add((linha['tipo_parceria'].toString()));
    });

    return (parcerias, tipos);
  }

  // _____________________________________ NOTICIAS ____________________________________

  Future<
      (
        List<(String, String, String, String, String)>,
        List<String>,
      )> MostrarNoticias() async {
    List<(String, String, String, String, String)> noticias = [];
    List<String> tipos = [];
    Database db = await basededados;
    List<Map<String, Object?>> resultado = await db.rawQuery(
        'select id_noticia, titulo_noticia, subtitulo_noticia, corpo_noticia, imagem_noticia,tipo_noticia from noticias');
    resultado.forEach((linha) {
      noticias.add((
        linha['titulo_noticia'].toString(),
        linha['subtitulo_noticia'].toString(),
        linha['corpo_noticia'].toString(),
        linha['imagem_noticia'].toString(),
        linha['tipo_noticia'].toString()
      ));
    });

    List<Map<String, Object?>> resultadoTipo =
        await db.rawQuery('select tipo_noticia from tipo_noticia');
    resultadoTipo.forEach((linha) {
      tipos.add((linha['tipo_noticia'].toString()));
    });
    return (noticias, tipos);
  }

  Future<void> CriarTabelaNoticias() async {
    Database db = await basededados;
    await db.execute('''
    CREATE TABLE IF NOT EXISTS noticias (
      id_noticia INTEGER PRIMARY KEY AUTOINCREMENT,
      titulo_noticia TEXT,
      subtitulo_noticia TEXT,
      corpo_noticia TEXT,
      imagem_noticia TEXT,
      tipo_noticia TEXT
    )
  ''');
  }

  Future<void> inserirNoticias(
      List<(String, String, String, String, String)> noticiaData) async {
    Database db = await basededados;

    await db.delete('noticias');

    for (final (
          titulo_noticia,
          subtitulo_noticia,
          corpo_noticia,
          imagem_noticia,
          tipo_noticia
        ) in noticiaData) {
      await db.rawInsert(
          'INSERT INTO noticias (titulo_noticia,subtitulo_noticia,corpo_noticia,imagem_noticia,tipo_noticia) VALUES (?,?,?,?,?)',
          [
            titulo_noticia,
            subtitulo_noticia,
            corpo_noticia,
            imagem_noticia,
            tipo_noticia
          ]);
      print(titulo_noticia);
    }
  }

//______________--TIPO DE NOTICIA
  Future<void> CriarTabelaTipoNoticia() async {
    Database db = await basededados;
    await db.execute('''
    CREATE TABLE IF NOT EXISTS tipo_noticia(
      id_tipo_noticia INTEGER PRIMARY KEY AUTOINCREMENT,
      tipo_noticia TEXT
    )
  ''');
  }

  Future<void> InsertTipoNoticia(tipo_noticia) async {
    Database db = await basededados;
    for (final tiposnoticia in tipo_noticia) {
      await db.rawInsert(
          'insert into tipo_noticia(tipo_noticia) values("$tiposnoticia")');
      print(tiposnoticia);
    }
  }

  Future<List<String>> MostrarTipoNoticia() async {
    List<String> uts = [];
    Database db = await basededados;
    List<Map<String, Object?>> resultado =
        await db.rawQuery('select tipo_noticia from tipo_noticia');
    resultado.forEach((linha) {
      uts.add(linha['tipo_noticia'].toString());
    });
    return uts;
  }

  Future<void> apagatabelaNoticias() async {
    Database db = await basededados;
    await db.execute('Delete from tipo_noticia');
  }

  Future<void> apagatabelaTipoNoticias() async {
    Database db = await basededados;
    await db.execute('''
Drop TABLE tipo_noticia
''');
  }

  //_______________ despesas Viatura propria

  Future<void> CriarTabelaDespesas() async {
    Database db = await basededados;
    await db.execute('''
    CREATE TABLE despesas (
      id_despesas INTEGER PRIMARY KEY AUTOINCREMENT,
      tipo_estado TEXT,
      data_deslocacao TEXT
    )
  ''');
  }

  Future<void> InsertDespesas(List<(String, String)> despesasData) async {
    Database db = await basededados;
    for (final (tipo_estado, data_deslocacao) in despesasData) {
      await db.rawInsert(
        'insert into despesas(tipo_estado, data_deslocacao) values(?, ?)',
        [tipo_estado, data_deslocacao],
      );
      //print(data['data_deslocacao']);
    }
  }

  Future<List<(String, String)>> MostrarDespesas() async {
    List<(String, String)> despesas = [];
    Database db = await basededados;
    List<Map<String, Object?>> resultado =
        await db.rawQuery('select tipo_estado, data_deslocacao from despesas');
    resultado.forEach((linha) {
      despesas.add((
        linha['tipo_estado'].toString(),
        linha['data_deslocacao'].toString()
      ));
    });
    return despesas;
  }

//_______________ ferias

  Future<void> CriarTabelaFerias() async {
    Database db = await basededados;
    await db.execute('''
    CREATE TABLE ferias (
      id_ferias INTEGER PRIMARY KEY AUTOINCREMENT,
      tipo_estado TEXT,
      data_submissao TEXT
    )
  ''');
  }

  Future<void> InsertFerias(List<(String, String)> feriasData) async {
    Database db = await basededados;
    for (final (tipo_estado, data_submissao) in feriasData) {
      await db.rawInsert(
        'insert into ferias(tipo_estado, data_submissao) values(?, ?)',
        [tipo_estado, data_submissao],
      );
      //print(data['data_deslocacao']);
    }
  }

  Future<List<(String, String)>> MostrarFerias() async {
    List<(String, String)> ferias = [];
    Database db = await basededados;
    List<Map<String, Object?>> resultado =
        await db.rawQuery('select tipo_estado, data_submissao from ferias');
    resultado.forEach((linha) {
      ferias.add((
        linha['tipo_estado'].toString(),
        linha['data_submissao'].toString()
      ));
    });
    return ferias;
  }

  //_______________ horas

  Future<void> CriarTabelaHoras() async {
    Database db = await basededados;
    await db.execute('''
    CREATE TABLE horas (
      id_horas INTEGER PRIMARY KEY AUTOINCREMENT,
      tipo_estado TEXT,
      data_relatorio_horas TEXT
    )
  ''');
  }

  Future<void> InsertHoras(List<(String, String)> horasData) async {
    Database db = await basededados;
    for (final (tipo_estado, data_relatorio_horas) in horasData) {
      await db.rawInsert(
        'insert into horas(tipo_estado, data_relatorio_horas) values(?, ?)',
        [tipo_estado, data_relatorio_horas],
      );
      //print(data['data_deslocacao']);
    }
  }

  Future<List<(String, String)>> MostrarHoras() async {
    List<(String, String)> horas = [];
    Database db = await basededados;
    List<Map<String, Object?>> resultado = await db
        .rawQuery('select tipo_estado, data_relatorio_horas from horas');
    resultado.forEach((linha) {
      horas.add((
        linha['tipo_estado'].toString(),
        linha['data_relatorio_horas'].toString()
      ));
    });
    return horas;
  }

  //_______________ ajudas

  Future<void> CriarTabelaAjudas() async {
    Database db = await basededados;
    await db.execute('''
    CREATE TABLE ajudas (
      id_ajuda INTEGER PRIMARY KEY AUTOINCREMENT,
      tipo_estado TEXT,
      valor_ajuda TEXT
    )
  ''');
  }

  Future<void> InsertAjuda(List<(String, String)> ajudaData) async {
    Database db = await basededados;
    for (final (tipo_estado, valor_ajuda) in ajudaData) {
      await db.rawInsert(
        'insert into ajudas(tipo_estado, valor_ajuda) values(?, ?)',
        [tipo_estado, valor_ajuda],
      );
      //print(data['data_deslocacao']);
    }
  }

  Future<List<(String, String)>> MostrarAjudas() async {
    List<(String, String)> ajudas = [];
    Database db = await basededados;
    List<Map<String, Object?>> resultado =
        await db.rawQuery('select tipo_estado, valor_ajuda from ajudas');
    resultado.forEach((linha) {
      ajudas.add(
          (linha['tipo_estado'].toString(), linha['valor_ajuda'].toString()));
    });
    return ajudas;
  }

  //_______________ reunioes

  Future<void> CriarTabelaReunioes() async {
    Database db = await basededados;
    await db.execute('''
    CREATE TABLE reunioes (
      id_reuniao INTEGER PRIMARY KEY AUTOINCREMENT,
      confirmar_reuniao TEXT,
      data_reuniao TEXT,
      horas TEXT
    )
  ''');
  }

  Future<void> InsertReuniao(List<(String, String, String)> reuniaoData) async {
    Database db = await basededados;
    for (final (confirmar_reuniao, data_reuniao, horas) in reuniaoData) {
      await db.rawInsert(
        'insert into reunioes(confirmar_reuniao, data_reuniao,horas) values(?, ?,?)',
        [confirmar_reuniao, data_reuniao, horas],
      );
      //print(data['data_deslocacao']);
    }
  }

  Future<List<(String, String, String)>> MostrarReunioes() async {
    List<(String, String, String)> reunioes = [];
    Database db = await basededados;
    List<Map<String, Object?>> resultado = await db
        .rawQuery('select confirmar_reuniao, data_reuniao,horas from reunioes');
    resultado.forEach((linha) {
      reunioes.add((
        linha['confirmar_reuniao'].toString(),
        linha['data_reuniao'].toString(),
        linha['horas'].toString()
      ));
    });
    return reunioes;
  }

  //_______________ recibos

  Future<void> CriarTabelaRecibos() async {
    Database db = await basededados;
    await db.execute('''
    CREATE TABLE recibos (
      id_recibos INTEGER PRIMARY KEY AUTOINCREMENT,
      data_submissao_recibo TEXT,
      recibo_pdf TEXT,
      data_recibo TEXT
    )
  ''');
  }

  Future<void> InsertRecibos(
      List<(String, String, String, String)> reciboData) async {
    Database db = await basededados;
    for (final (
          data_submissao_recibo,
          recibo_pdf,
          data_recibo,
          confirmacao_submissao_recibo
        ) in reciboData) {
      await db.rawInsert(
        'insert into recibos(data_submissao_recibo, recibo_pdf,data_recibo) values(?, ?,?)',
        [data_submissao_recibo, recibo_pdf, data_recibo],
      );
      //print(data['data_deslocacao']);
    }
  }

  Future<List<(String, String, String)>> MostrarRecibos() async {
    List<(String, String, String)> recibos = [];
    Database db = await basededados;
    List<Map<String, Object?>> resultado = await db.rawQuery(
        'select data_submissao_recibo, recibo_pdf,horas data_recibo from recibos');
    resultado.forEach((linha) {
      recibos.add((
        linha['data_submissao_recibo'].toString(),
        linha['recibo_pdf'].toString(),
        linha['data_recibo'].toString()
      ));
    });
    return recibos;
  }

   Future<String> MostrarRecibo(int mes, int ano) async {
    String linkDoc = "";
    Database db = await basededados;
    List<Map<String, Object?>> resultado = await db.rawQuery(
        "SELECT recibo_pdf FROM recibos WHERE strftime('%Y', data_recibo) = '$ano' AND strftime('%m', data_recibo) = '$mes';");
    resultado.forEach((linha) {
        linkDoc = linha['recibo_pdf'].toString();
    });
    print("Número de resultados: ${resultado.length}");
    linkDoc = "https://www.google.com";
    print("linkzaoo $linkDoc");
    return linkDoc;
  }

  //_______________ informacoes

  Future<void> CriarTabelaInfos() async {
    Database db = await basededados;

    await db.execute('''
    CREATE TABLE informacoes (
      id_recibos INTEGER PRIMARY KEY AUTOINCREMENT,
      titulo_informacao TEXT,
      descricao_informacao TEXT,
      documento_comprovativo TEXT,
      tipo_informacao TEXT
    )
  ''');
  }

  Future<void> InsertInfos(
      List<(String, String, String, String)> infosData) async {
    Database db = await basededados;
    await db.delete('informacoes');
    for (final (
          titulo_informacao,
          descricao_informacao,
          documento_comprovativo,
          tipo_informacao
        ) in infosData) {
      await db.rawInsert(
        'insert into informacoes(titulo_informacao, descricao_informacao,documento_comprovativo,tipo_informacao) values(?, ?,?,?)',
        [
          titulo_informacao,
          descricao_informacao,
          documento_comprovativo,
          tipo_informacao
        ],
      );
      print("1 + $titulo_informacao");
    }
  }

  //_____________ pessoas

  Future<void> CriarTabelaPessoas() async {
    Database db = await basededados;
    await db.execute('''
    CREATE TABLE pessoas (
      id_pessoa INTEGER PRIMARY KEY AUTOINCREMENT,
      nome_pessoa TEXT,
      email TEXT,
      contribuinte TEXT,
      password TEXT
    )
  ''');
  }

  Future<void> InsertPessoas(
      List<(String, String, String, String)> pessoasData) async {
    Database db = await basededados;
    await db.delete('pessoas');
    for (final (nome_pessoa, email, contribuinte, password) in pessoasData) {
      await db.rawInsert(
        'insert into pessoas(nome_pessoa, email,contribuinte,password) values(?, ?,?,?)',
        [nome_pessoa, email, contribuinte, password],
      );
      //print(data['data_deslocacao']);
    }
  }

  Future<
      (
        String,
        String,
        String,
        String,
        List<(String, String, String, String)>
      )> MostrarPessoas() async {
    String nome = "";
    String email = "";
    String contribuinte = "";
    String password = "";
    List<(String, String, String, String)> informacoes = [];

    Database db = await basededados;

    List<Map<String, Object?>> resultado = await db.rawQuery(
        'select nome_pessoa, email,contribuinte,password from pessoas');
    resultado.forEach((linha) {
      nome = linha['nome_pessoa'].toString();
      email = linha['email'].toString();
      contribuinte = linha['contribuinte'].toString();
      password = ['password'].toString();
    });

    List<Map<String, Object?>> resultado1 =
        await db.rawQuery('select * from informacoes');
    resultado1.forEach((linha) {
      informacoes.add((
        linha['titulo_informacao'].toString(),
        linha['descricao_informacao'].toString(),
        linha['documento_comprovativo'].toString(),
        linha['tipo_informacao'].toString()
      ));
    });

    return (nome, email, contribuinte, password, informacoes);
  }

  Future<void> apagarInformacaoProfissional(String tituloParam) async {
    Database db = await basededados;
    await db.rawDelete(
        'DELETE FROM informacoes WHERE titulo_informacao = ?', [tituloParam]);
  }
}

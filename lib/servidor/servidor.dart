import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Servidor {
  var baseURL = 'http://192.168.1.8:3000';
  var url;
  Future<List<String>> listaProdutos() async {
    List<String> prods = [];
    var result = await http.get(Uri.parse(url));
    var lista = jsonDecode(result.body)['products'];
    lista.forEach((linha) {
      prods.add(linha['title'].toString());
    });
    return prods;
  }

  Future<(List<(int, String, String, String, String, String,bool)>, List<String>)>
      listarParceriasServer() async {
    url = 'https://backend-olisipo-portal.onrender.com/parcerias';
    List<(int, String, String, String, String, String, bool)> parcerias = [];
    List<String> TipoParcerias = [];
    var result = await http.get(Uri.parse(url));

    var lista1 = jsonDecode(result.body)['data1'];
    lista1.forEach((linha) {
      parcerias.add((
        linha['id_parceria'],
        linha['imagem_parceria'].toString(),
        linha['nome_parceria'].toString(),
        linha['descricao_parceria'].toString(),
        linha['beneficios_parceria'].toString(),
        linha['tipo_parceria'].toString(),
        linha['parceria_publicada']
      ));
    });

    var lista2 = jsonDecode(result.body)['data2'];
    lista2.forEach((linha) {
      TipoParcerias.add((linha['tipo_parceria'].toString()));
    });

    return (parcerias, TipoParcerias);
  }

  Future<List<(String, String)>> listaUsers() async {
    List<(String, String)> prods = [];
    var result = await http.get(Uri.parse(url));
    var lista = jsonDecode(result.body)['users'];
    lista.forEach((linha) {
      prods.add((linha['firstName'].toString(), linha['lastName'].toString()));
    });
    return prods;
  }

  Future<void> inserirDespesasViaturaPropria(
      int idPessoa,
      double quilometros,
      String dataDeslocacao,
      String pontoOrigem,
      String pontoChegada,
      bool confirmacaoDespesas) async {
    var url = '$baseURL/despesasviatura/create';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_pessoa_param': idPessoa,
        'quilometros_param': quilometros,
        'data_deslocacao_param': dataDeslocacao,
        'ponto_origem_param': pontoOrigem,
        'ponto_chegada_param': pontoChegada,
        'confirmacao_despesas_param': confirmacaoDespesas,
      }),
    );
  }

  Future<void> inserirAjudaCusto(
      int idPessoa,
      double valorAjuda,
      String descritivoAjuda,
      String faturaAjuda,
      bool confirmacaoAjudas) async {
    var url = '$baseURL/ajudascusto/create';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_pessoa_param': idPessoa,
        'valor_ajuda_param': valorAjuda,
        'descritivo_ajuda_param': descritivoAjuda,
        'fatura_ajuda_param': faturaAjuda,
        'confirmacao_despesas_param': confirmacaoAjudas,
      }),
    );
  }

  Future<void> inserirHoras(
    int idPessoa,
    String dataRelatorio,
    String mes,
    String horasEfetuadas,
    bool confirmacaoRelatorio,
    int anoRelatorio,
  ) async {
    var url = '$baseURL/horas/create';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_pessoa_param': idPessoa,
        'data_relatorio_param': dataRelatorio,
        'mes_param': mes,
        'horas_efetuadas_param': horasEfetuadas,
        'confirmacao_relatorio_param': confirmacaoRelatorio,
        'ano_relatorio_param': anoRelatorio,
      }),
    );
  }

  Future<void> inserirFerias(
    int idPessoa,
    String dataInicio,
    String dataFim,
    String dataSubmissao,
    bool confirmacaoFerias,
  ) async {
    var url = '$baseURL/ferias/create';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_pessoa_param': idPessoa,
        'data_inicio_param': dataInicio,
        'data_fim_param': dataFim,
        'data_submissao_param': dataSubmissao,
        'confirmacao_ferias_param': confirmacaoFerias,
      }),
    );

    if (response.statusCode == 200) {
      print('Férias inseridas com sucesso!');
    } else {
      print('Erro ao Férias: ${response.statusCode}');
      throw Exception('Falha ao inserir informação profissional');
    }
  }

  Future<void> inserirInformacaoProfissional(int idPessoa, String titulo,
      String descricao, String documento, String tipo) async {
    var url = '$baseURL/informacoesprof/create';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_pessoa_param': idPessoa,
        'titulo_param': titulo,
        'descricao_param': descricao,
        'documento_param': documento,
        'tipo_param': tipo,
      }),
    );

    if (response.statusCode == 200) {
      print('Informação profissional inserida com sucesso!');
    } else {
      print('Erro ao inserir informação profissional: ${response.statusCode}');
      throw Exception('Falha ao inserir informação profissional');
    }
  }

  Future<void> inserirReuniao(
    String dataReuniao,
    String motivoReuniao,
    String horasReuniao,
  ) async {
    var url = '$baseURL/reuniao/create';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'data_reuniao_param': dataReuniao,
        'motivo_param': motivoReuniao,
        'horas_param': horasReuniao,
      }),
    );

    if (response.statusCode == 200) {
      print('Informação profissional inserida com sucesso!');
    } else {
      print('Erro ao inserir informação profissional: ${response.statusCode}');
      throw Exception('Falha ao inserir informação profissional');
    }
  }

  Future<List<(int, String, String, String, String, String, String)>>
      listardashboardServer() async {
    url = 'https://backend-olisipo-portal.onrender.com/noticias';
    List<(int, String, String, String, String, String, String)> nts = [];
    var result = await http.get(Uri.parse(url));
    var lista = jsonDecode(result.body)['data'];
    lista.forEach((linha) {
      nts.add((
        linha['id_noticia'],
        linha['id_tipo_noticia'].toString(),
        linha['titulo_noticia'].toString(),
        linha['subtitulo_noticia'].toString(),
        linha['corpo_noticia'].toString(),
        linha['imagem_noticia'],
        linha['tipo_noticia'].toString()
      ));
    });
    return nts;
  }
}

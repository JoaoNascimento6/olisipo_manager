import 'dart:ffi';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'basededados.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Servidor {
  var baseURL = 'https://backend-olisipo-portal.onrender.com';
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

  Future<void> getNoticiasEParcerias() async {
    url =
        'https://backend-olisipo-portal.onrender.com/appmobile/noticiasparcerias';
    List<(String, String, String, String, String)> parcerias = [];
    List<String> TipoParcerias = [];
    List<(String, String, String, String, String)> noticias = [];
    List<String> TipoNoticias = [];
    var bd = Basededados();

    var result = await http.get(
      Uri.parse(url),
    );


    var lista1 = jsonDecode(result.body)['parcerias'];
    lista1.forEach((linha) {
      parcerias.add((
        linha['imagem_parceria'].toString(),
        linha['nome_parceria'].toString(),
        linha['descricao_parceria'].toString(),
        linha['beneficios_parceria'].toString(),
        linha['tipo_parceria'].toString()
      ));
    });
    var lista2 = jsonDecode(result.body)['tipoParcerias'];
    lista2.forEach((linha) {
      TipoParcerias.add((linha['tipo_parceria'].toString()));
    });
    var lista3 = jsonDecode(result.body)['noticias'];
    lista3.forEach((linha) {
      noticias.add((
        linha['titulo_noticia'].toString(),
        linha['subtitulo_noticia'].toString(),
        linha['corpo_noticia'].toString(),
        linha['imagem_noticia'].toString(),
        linha['tipo_noticia'].toString()
      ));
    });

    var lista4 = jsonDecode(result.body)['tipoNoticias'];
    lista4.forEach((linha) {
      TipoNoticias.add((linha['tipo_noticia'].toString()));
    });
    bd.inserirParceria(parcerias);
    bd.InsertTipoParceria(TipoParcerias);
    bd.InsertTipoNoticia(TipoNoticias);
    bd.inserirNoticias(noticias);
  }

  Future<void> getDadosServidor() async {
    url = 'https://backend-olisipo-portal.onrender.com/appmobile';

    List<(String, String, String, String)> informacoesProfissionais = [];
    List<(String, String)> despesasViatura = [];
    List<(String, String,String)> ferias = [];
    List<(String, String)> horas = [];
    List<(String, String)> ajudas = [];
    List<(String, String, String)> reunioes = [];
    List<(int, String, String, String)> recibos = [];
    List<(String, String, String, String)> pessoas = [];
    var bd = Basededados();

    String? token = await obterTokenLocalmente();
    var result = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );

    var lista5 = jsonDecode(result.body)['informacoesProfissionais'];
    lista5.forEach((linha) {
      informacoesProfissionais.add((
        linha['titulo_informacao'].toString(),
        linha['descricao_informacao'].toString(),
        linha['documento_comprovativo'].toString(),
        linha['tipo_informacao'].toString()
      ));
    });

    var lista6 = jsonDecode(result.body)['despesasViatura'];
    lista6.forEach((linha) {
      despesasViatura.add((
        linha['tipo_estado'].toString(),
        linha['data_deslocacao'].toString()
      ));
    });

    var lista7 = jsonDecode(result.body)['ferias'];
    lista7.forEach((linha) {
      ferias.add((
        linha['tipo_estado'].toString(),
        linha['data_comeco'].toString(),
        linha['data_fim'].toString()
      ));
    });

    var lista8 = jsonDecode(result.body)['horas'];
    lista8.forEach((linha) {
      horas.add((
        linha['tipo_estado'].toString(),
        linha['mes'].toString()
      ));
    });

    var lista9 = jsonDecode(result.body)['ajudas'];
    lista9.forEach((linha) {
      ajudas.add(
          (linha['tipo_estado'].toString(), linha['valor_ajuda'].toString()));
    });
    var lista10 = jsonDecode(result.body)['reunioes'];
    lista10.forEach((linha) {
      reunioes.add((
        linha['confirmar_reuniao'].toString(),
        linha['data_reuniao'].toString(),
        linha['horas'].toString(),
      ));
    });

    var lista11 = jsonDecode(result.body)['recibos'];
    lista11.forEach((linha) {
      recibos.add((
        linha['id_recibo'],
        linha['data_submissao_recibo'].toString(),
        linha['recibo_pdf'].toString(),
        linha['data_recibo'].toString()
      ));
      print("1 $recibos");
    });

    var lista12 = jsonDecode(result.body)['dadosPessoais'];
    lista12.forEach((linha) {
      pessoas.add((
        linha['nome_pessoa'].toString(),
        linha['email'].toString(),
        linha['contribuinte'].toString(),
        linha['password'].toString()
      ));
    });

    bd.InsertPessoas(pessoas);
    bd.InsertInfos(informacoesProfissionais);

    bd.InsertAjuda(ajudas);
    bd.InsertDespesas(despesasViatura);
    bd.InsertFerias(ferias);
    bd.InsertHoras(horas);
    bd.InsertReuniao(reunioes);

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
      String? token,
      double quilometros,
      String dataDeslocacao,
      String pontoOrigem,
      String pontoChegada,
      bool confirmacaoDespesas) async {
    var url =
        'https://backend-olisipo-portal.onrender.com/despesasviatura/create';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'quilometros_param': quilometros,
        'data_deslocacao_param': dataDeslocacao,
        'ponto_origem_param': pontoOrigem,
        'ponto_chegada_param': pontoChegada,
        'confirmacao_despesas_param': confirmacaoDespesas,
      }),
    );

    if (response.statusCode == 200) {
      print('Despesas de Viatura Própria inseridas com sucesso!');
    } else {
      print('Erro em Despesas de Viatura Própria: ${response.statusCode}');
      throw Exception('Falha ao inserir Despesas de Viatura Própria');
    }
  }

  Future<void> inserirAjudaCusto(
      String? token,
      double valorAjuda,
      String descritivoAjuda,
      String faturaAjuda,
      bool confirmacaoAjudas) async {
    var url = '$baseURL/ajudascusto/create';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'valor_ajuda_param': valorAjuda,
        'descritivo_ajuda_param': descritivoAjuda,
        'fatura_ajuda_param': faturaAjuda,
        'confirmacao_despesas_param': confirmacaoAjudas,
      }),
    );

    if (response.statusCode == 200) {
      print('Ajudas de Custo inseridas com sucesso!');
    } else {
      print('Erro em Ajudas de Custo inseridas: ${response.statusCode}');
      throw Exception('Falha ao inserir Ajudas de Custo inseridas');
    }
  }

  Future<void> inserirHoras(
    String? token,
    String dataRelatorio,
    String mes,
    int horasEfetuadas,
    bool confirmacaoRelatorio,
    int anoRelatorio,
  ) async {
    var url = '$baseURL/horas/create';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'data_relatorio_param': dataRelatorio,
        'mes_param': mes,
        'horas_efetuadas_param': horasEfetuadas,
        'confirmacao_relatorio_param': confirmacaoRelatorio,
        'ano_relatorio_param': anoRelatorio,
      }),
    );

    if (response.statusCode == 200) {
      print('Horas inseridas com sucesso!');
    } else {
      print('Erro em Horas inseridas: ${response.statusCode}');
      throw Exception('Falha ao inserir Horas inseridas');
    }
  }

  Future<void> inserirFaltas(String? token, String dataFalta, int horasFalta,
      String justificacao, bool confirmacaoFaltas) async {
    var url = '$baseURL/faltas/create';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'data_falta_param': dataFalta,
        'horas_faltadas_param': horasFalta,
        'justificacao_param': justificacao,
        'confirmacao_faltas_param': confirmacaoFaltas,
      }),
    );

    if (response.statusCode == 200) {
      print('Faltas inseridas com sucesso!');
    } else {
      print('Erro em Faltas inseridas: ${response.statusCode}');
      throw Exception('Falha ao inserir Faltas inseridas');
    }
  }

  Future<void> inserirFerias(
    String? token,
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
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
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

  Future<void> inserirInformacaoProfissional(String? token, String titulo,
      String descricao, String documento, String tipo) async {
    var url = '$baseURL/informacoesprof/create';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
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
    String? token,
    String dataReuniao,
    String motivoReuniao,
    String horasReuniao,
  ) async {
    var url = '$baseURL/reuniao/create';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'data_reuniao_param': dataReuniao,
        'motivo_param': motivoReuniao,
        'horas_param': horasReuniao,
      }),
    );

    if (response.statusCode == 200) {
      print('Reunião inserida com sucesso!');
    } else {
      print('Erro ao inserir Reunião: ${response.statusCode}');
      throw Exception('Falha ao inserir Reunião');
    }
  }

  Future<String?> login(String emailLogin, String passLogin) async {
    var url = '$baseURL/pessoas/login';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email_param': emailLogin,
        'pass_param': passLogin,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      String? token = responseBody['token'];

      return token;
    } else {
      return null;
    }
  }

  Future<void> inserirDadosAuxiliares(
    String? token,
    String nomeAuxiliar,
    String emailAuxiliar,
  ) async {
    var url = '$baseURL/pessoasauxiliar/create';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'nome_auxiliar_param': nomeAuxiliar,
        'email_auxiliar_param': emailAuxiliar,
      }),
    );

    if (response.statusCode == 200) {
      print('Dados Auxiliares inseridos com sucesso!');
    } else {
      print('Erro ao inserir Dados Auxiliares: ${response.statusCode}');
      throw Exception('Falha ao inserir Dados Auxiliares');
    }
  }

  Future<void> updatePassword(
    String? token,
    String password,
  ) async {
    var url = '$baseURL/pessoas/update';

    var response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'pass_pessoa_param': password,
      }),
    );

    if (response.statusCode == 200) {
      print('Password atualizada com sucesso!');
    } else {
      print('Erro ao atualizar a password: ${response.statusCode}');
      throw Exception('Falha ao atualizar a Password');
    }
  }

  Future<void> updatePasswordporEmail(String email, String password) async {
    var url =
        '$baseURL/pessoas/updatepormail'; // Use a URL correta conforme sua API

    try {
      var response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email_param': email,
          'pass_pessoa_param': password,
        }),
      );

      if (response.statusCode == 200) {
        print('Password atualizada com sucesso!');
      } else {
        print('Erro ao atualizar a password: ${response.statusCode}');
        throw Exception('Falha ao atualizar a Password');
      }
    } catch (error) {
      print('Erro na chamada da API: $error');
      throw Exception('Erro na chamada da API');
    }
  }

  Future<void> enviarEmail(String email, String code) async {
    var url =
        '$baseURL/pessoas/enviarmail';

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email_param': email,
          'code': code,
        }),
      );

      if (response.statusCode == 200) {
        print('Código enviado!');
      } else {
        print('Erro ao enviar codigo: ${response.statusCode}');
        throw Exception('Falha ao enviar o código');
      }
    } catch (error) {
      print('Erro na chamada da API: $error');
    }
  }

  Future<void> logout(
    String? token,
  ) async {
    var url = '$baseURL/pessoas/logout';

    try {
      var response = await http.post(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        await removeToken();
        print('Logout com sucesso!');
      } else {
        print(
            'Erro ao fazer logout. Código de resposta: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao fazer logout: $e');
    }
  }

  Future<void> eliminarInformacaoProfissional(
      String? token, String tituloInformacao) async {
    var url = '$baseURL/informacoesprof/delete';

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
          <String, dynamic>{'titulo_informacao_param': tituloInformacao}),
    );

    if (response.statusCode == 200) {
      print('Informação Profissional eliminada com sucesso!');
    } else {
      print(
          'Erro ao eliminar a Informação Profissional: ${response.statusCode}');
      throw Exception('Falha ao eliminar a Informação Profissional');
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String?> obterTokenLocalmente() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}

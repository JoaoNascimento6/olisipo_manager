import 'dart:convert';
import 'package:http/http.dart' as http;

class Servidor {
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

  Future<List<(int, String, String,String,String)>> listarParceriasServer() async {
    url = 'https://backend-olisipo-portal.onrender.com/parcerias';
    List<(int, String, String,String,String)> prods = [];
    var result = await http.get(Uri.parse(url));
    var lista = jsonDecode(result.body)['data'];
    lista.forEach((linha) {
      prods.add((
        linha['id_parceria'],
        linha['imagem_parceria'].toString(),
        linha['nome_parceria'].toString(),
        linha['descricao_parceria'].toString(),
        linha['beneficios_parceria'].toString()

      ));
    });

    return prods;
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
}

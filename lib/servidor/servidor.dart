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

  Future<List<(int,String, String)>> listaProdutosImg() async {
    List<(int,String, String)> prods = [];
    var result = await http.get(Uri.parse(url));
    var lista = jsonDecode(result.body)['products'];
    lista.forEach((linha) {
      prods.add(
        (linha['id'],linha['thumbnail'].toString(), linha['title'].toString())
      );
    });
    return prods;
  }

   Future<List<(String, String)>> listaUsers() async {
    List<(String, String)> prods = [];
    var result = await http.get(Uri.parse(url));
    var lista = jsonDecode(result.body)['users'];
    lista.forEach((linha) {
      prods.add(
        (linha['firstName'].toString(), linha['lastName'].toString())
      );
    });
    return prods;
  }

}

import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) { //Define as ações que o usuário pode usar

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = ""; //Limpa a pesquisa
        }, 
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) { //Define o botão de voltar (vai pra outra tela...)

    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, "");
      },   
    );
  }

  @override
  Widget buildResults(BuildContext context) { //Constrói os resultados do q foi pesquisado

    close(context, query); //Fecha a pesquisa e mostra a query de resultado
    return Container();

  }

  @override
  Widget buildSuggestions(BuildContext context) { //Define sugestões de pesquisa

    return Container();

    /*
    List<String> lista =  [];

    if(query.isNotEmpty){

      lista = ["Falen", "Coldzera", "Fnx", "Fer", "Boltz", "Se leu é Gay"].where(
        (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index){
        
          return ListTile(
            onTap: (){
              close(context, lista[index]); 
            },
            title: Text(lista[index]),
          );
        }
      );
    }else {

      return Center(
        child: Text("Nenhum resultado para a pesquisa!"),
      );
    }
    */

  }

}
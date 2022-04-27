import 'package:flutter/material.dart';
import 'package:youtube_app/telas/biblioteca.dart';
import 'package:youtube_app/telas/emAlta.dart';
import 'package:youtube_app/telas/inicio.dart';
import 'package:youtube_app/telas/inscricao.dart';
import 'CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData( //Define cor padrão para os itens
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "image/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [

          IconButton( 
            icon: const Icon(Icons.search),
            onPressed: ()  async{
              String? res = await showSearch(
                context: context, 
                delegate: CustomSearchDelegate()
              );
              setState(() {
                _resultado = res!;
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual] //Mostra a tela(aba) que foi clicada
      ),  
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.shifting, //Permite trocar as cores de fundo
        type: BottomNavigationBarType.fixed, //Não permite mudar as cores de fundo
        fixedColor: const Color.fromRGBO(255, 1, 0, 1), //Quando clica muda a cor do icon
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice; //Recebe o botão clicado e atualiza o estado 
          });
        },
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            label: "Início",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.red,
            label: "Em alta",
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
            label: "Inscrições",
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.green,
            label: "Biblioteca",
            icon: Icon(Icons.folder)
          ),
        ]
      ),
    );
  }
}
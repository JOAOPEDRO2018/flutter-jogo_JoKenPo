import 'dart:math';

import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  var _imagemFundo = AssetImage("image/padrao.png");
  var _resul = "Escolha uma opção";

  void _jogada(int valor){
    print("número: $valor");
    var escolha = Random().nextInt(3);

    if(escolha==valor ){
      _resul = "Empate";
    }
    else if (escolha == 0 && valor == 1){
      _resul = "Perdeu\n Tente novamente se estiver preparado hehehe";
    }
    else if (escolha == 0 && valor == 2){
      _resul = "Ganhou!\n Mas na proxima eu posso levar a melhor hein! hehehe";
    }
    else if (escolha == 1 && valor == 2){
      _resul = "Perdeu\n Tente novamente se estiver preparado hehehe";
    }
    else if (escolha == 1 && valor == 0){
      _resul = "Ganhou!\n Mas na proxima eu posso levar a melhor hein! hehehe";
    }
    else if (escolha == 2 && valor == 0){
      _resul = "Perdeu\n Tente novamente se estiver preparado hehehe";
    }
    else if (escolha == 2 && valor == 1){
      _resul = "Ganhou!\n Mas na proxima eu posso levar a melhor hein! hehehe";
    }



    switch(escolha){
      case 0:
        setState(() {
          _imagemFundo = AssetImage("image/papel.png");

        });
        break;
      case 1:
        setState(() {
          _imagemFundo = AssetImage("image/pedra.png");
        });
        break;
      case 2:
        setState(() {
          _imagemFundo = AssetImage("image/tesoura.png");
        });
        break;

    }
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "JoKenPo",
            style: TextStyle(fontSize: 21),
          ),
        ),
        //corpo do app
        body: Column(
          children: <Widget>[
            //texto
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: Text(
                "Escolha do App:",
                style: TextStyle(fontSize: 25),
              ),
            ),

            Image(image: this._imagemFundo,height: 160,),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Text(
                _resul,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25,),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                   onTap: (){
                     _jogada(0);
                   },
                  child: Image.asset(
                    "image/papel.png",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _jogada(1);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Image.asset(
                      "image/pedra.png",
                      height: 100,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _jogada(2);
                  },
                  child: Image.asset(
                    "image/tesoura.png",
                    height: 100,
                  ),
                )
              ],
            ),

            //jogada adversaria
            //resultado
            //escolhas
          ],
        ),
      ),
    );
  }
}

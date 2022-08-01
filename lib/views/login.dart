import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifal_aula07/views/lista_tarefas.dart';

const String url1 = "https://minhabiblioteca.com.br/wp-content/uploads/2017/12/background.jpg";
const String url2 = "https://imagensemoldes.com.br/wp-content/uploads/2020/04/Imagem-dos-Simpsons-em-png.png";

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
            url1,
            fit: BoxFit.fill),
        Image.network(
            url2),
       Container(
         child: ElevatedButton(
             onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context){
             return ListaTarefas();
           }));
         }, child: Text("Entrar")),
       )
      ],
    );
  }
}

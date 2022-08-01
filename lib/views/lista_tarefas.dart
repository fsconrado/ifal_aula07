import 'package:flutter/material.dart';

const _tituloAppBar = Text("Lista de Tarefas");

class ListaTarefas extends StatefulWidget {
  const ListaTarefas({Key? key}) : super(key: key);

  @override
  State<ListaTarefas> createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  TextEditingController _editingController = TextEditingController();

  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _tituloAppBar,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _editingController,
            ),
            Container(
              height: 400,
              child: ListView.separated(
                itemCount: tarefas.length,
                separatorBuilder: (context, index)=> Divider(color: Colors.green),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tarefas[index]),
                    onLongPress: (){
                      setState((){
                        tarefas.removeAt(index);
                      });
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (_editingController.text.length > 0) {
                setState(() {
                  tarefas.add(_editingController.text);
                });
                _editingController.clear();
              }
              debugPrint(tarefas.toString());
            },
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
          ),
          Text(" "),
          FloatingActionButton(
            onPressed: () {
              if (_editingController.text.length > 0) {
                setState(() {
                  tarefas = [];
                });
                _editingController.clear();
              }
              debugPrint(tarefas.toString());
            },
            backgroundColor: Colors.green,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

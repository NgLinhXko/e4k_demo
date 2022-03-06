//chua all cv can lam
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'model/toto.dart';
class TodoList extends StatelessWidget{
  final List<Todo> todos;
  // ignore: prefer_const_constructors_in_immutables
  TodoList({Key? key, required this.todos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (context, index){
          return todos!=null?GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10.0),
              color: index %2 ==0 ?Colors.greenAccent : Colors.cyan,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(todos[index].fullname, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)),
                  new Text(todos[index].email, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)),
                  new Text(todos[index].mobile, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0))
                ],
              ),
            ),
            onTap: (){

            },
          ):Container();// cho phep lay tay cham vao tung item trong list
    },
    itemCount: todos.length,
    );
  }
}
class TodoScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    //TODO: implement createState
    return _TodoScreenState();
  }
}
class _TodoScreenState extends State<TodoScreen>{
  @override
  Widget build(BuildContext context){
    //TODO implement build
    return Scaffold(
      appBar: AppBar(
      title: Text("Resful API"),
    ),
      //the ho tro lay du lieu tren server ve va hien thi len day
      body: FutureBuilder(
        future: Todo.fetchTodos(http.Client()),
        //buider la phan giao dien
        builder: (context, snapshot){
            if(snapshot.hasError){
              print(snapshot.error);
            }
            var data;
            if(snapshot.data!=null){
               data=snapshot.data as List<Todo>;
            }

            return snapshot.hasData ?TodoList(todos: data):Center(child: CircularProgressIndicator());
        }),
    );
  }
}
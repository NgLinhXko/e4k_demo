import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;//de gui cac request len server
import '../global.dart';
class
     Todo{
    int id;
    String fullname;
    String email;
    String mobile;
    Todo({
        this.id = 0,
        this.fullname = '',
        this.email = '',
        this.mobile = ''
});
    //static method can call it accross class, not need across object
    //convert key:values-> object ttodo
    factory Todo.fromJson(Map<String, dynamic> json){
        return Todo(
          id: json["id"],
          fullname: json["fullname"],
          email: json["email"],
          mobile: json["mobile"]
        );
    }
    //fetch data from Resful API
    //ham assing co the chay song song voi cac ham khac
   static Future<List<Todo>>fetchTodos(http.Client client) async{
        // ignore: unused_local_variable
        final response = await client.get(Uri.parse(ULR_TODOS));//ham await de ho tro gui request len server, dong thoi dam bao request nay thuc hien xong thi moi toi cac ham khac
        if(response.statusCode == 200){

            Map<String, dynamic> mapResponse = json.decode(response.body);
            if(mapResponse["message"] == "all user data"){
              log('run');
                    final todos = mapResponse["data"].cast<Map<String, dynamic>>();
                    final listOfTodos =  await todos.map<Todo>((json){
                        return Todo.fromJson(json);
                    }).toList();
                    return listOfTodos;
            }else{
                return [];
            }
        }else{
            throw Exception('Failed to load Todo from the Internet');
        }
    }
}
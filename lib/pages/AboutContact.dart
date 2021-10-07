
import 'package:agendas/model/model.dart';
import 'package:agendas/provide/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AgendaProvider agendaProvider = Provider.of(context, listen: false);
    AgendaUser? agenda = ModalRoute.of(context)!.settings.arguments as AgendaUser?;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: ()=>Navigator.of(context).pop(), icon: Icon(Icons.arrow_back),),
          title: Text("${agenda!.name} ${agenda.lastName}"),
          actions: [
            IconButton(onPressed: (){
              agendaProvider.Delete(agenda.id);
              Navigator.of(context).pop();
            }, icon: Icon(Icons.delete))
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Nome: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("${agenda.name}", style: TextStyle(fontSize: 16))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Apelido:",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("${agenda.lastName}", style: TextStyle(fontSize: 16))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Numero:",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("${agenda.number}", style: TextStyle(fontSize: 16))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: ()=> Navigator.pushNamed(context, '/newContact', arguments: agenda),
                        icon: CircleAvatar(
                          child: Icon(Icons.edit),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:agendas/model/model.dart';
import 'package:agendas/provide/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newContacto extends StatefulWidget {
  newContacto({Key? key}) : super(key: key);

  @override
  _newContactoState createState() => _newContactoState();
}

class _newContactoState extends State<newContacto> {
  final form = GlobalKey<FormState>();
  Map<String, String> formData = {};
  @override
  Widget build(BuildContext context) {
    AgendaUser? EditAgenda =
        ModalRoute.of(context)!.settings.arguments as AgendaUser?;
    AgendaProvider agendaProvider = Provider.of(context, listen: false);

    void AddItems() {
      agendaProvider.AddItems(AgendaUser(
          name: formData['name'].toString(),
          lastName: formData['lastName'].toString(),
          number: formData['number'].toString()));
    }

    void UpdateData() {
      agendaProvider.Update(AgendaUser(
          id: formData['id'].toString(),
          name: formData['name'].toString(),
          lastName: formData['lastName'].toString(),
          number: formData['number'].toString()));
    }

    void clearCicleLife() {
      formData['id'] = '';
      formData['name'] = '';
      formData['lastName'] = '';
      formData['number'] = '';
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Adicionar novo contacto",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
          child: Column(children: [
            CircleAvatar(
              foregroundColor: Colors.grey,
              child: Icon(
                Icons.person_rounded,
              ),
            ),
            Form(
              key: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    initialValue:
                        EditAgenda != null ? EditAgenda.name : formData['name'],
                    decoration: InputDecoration(labelText: "Nome"),
                    onSaved: (e) => formData['name'] = e.toString(),
                  ),
                  TextFormField(
                    initialValue: EditAgenda != null
                        ? EditAgenda.lastName
                        : formData['Apelido'],
                    decoration: InputDecoration(labelText: "Apelido"),
                    onSaved: (e) => formData['lastName'] = e.toString(),
                  ),
                  TextFormField(
                    initialValue: EditAgenda != null
                        ? EditAgenda.number
                        : formData['Numero'],
                    decoration: InputDecoration(labelText: "Numero"),
                    onSaved: (e) => formData['number'] = e.toString(),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        form.currentState?.save();
                        if (EditAgenda != null) {
                          UpdateData();
                        clearCicleLife();
                          Navigator.of(context).pop();
                        } else {
                          AddItems();
                        clearCicleLife();
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('Adicionar')),
                ],
              ),
            ),
          ]),
        )),
      ),
    );
  }
}

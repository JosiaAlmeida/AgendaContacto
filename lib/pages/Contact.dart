
import 'package:agendas/components/ListAnother.dart';
import 'package:agendas/provide/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final AgendaProvider agendaProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Contactos"),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: ()=>Navigator.pushNamed(context, '/newContact'),)
        ],
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int i) {
              return ListAnother(agendaProvider.AllDataAgenda.elementAt(i));
            },
            childCount: agendaProvider.Count,
          ),
        ),
      ]),
    );
  }
}
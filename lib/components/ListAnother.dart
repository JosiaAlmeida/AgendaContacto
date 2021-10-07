
import 'package:agendas/model/model.dart';
import 'package:flutter/material.dart';

class ListAnother extends StatefulWidget {
  final AgendaUser agenda;

  const ListAnother(this.agenda);

  @override
  _ListAnotherState createState() => _ListAnotherState();
}

class _ListAnotherState extends State<ListAnother> {
  @override
  Widget build(BuildContext context) {
    //AgendaProvider agendaProvider = Provider.of(context, listen: false);
    final avatar = CircleAvatar(
      child: Icon(Icons.person),
    );
    return ListTile(
      leading: avatar,
      title: Text("${widget.agenda.name} ${widget.agenda.lastName}"),
      subtitle: Text(widget.agenda.number),
      onTap: () => Navigator.pushNamed(context, '/about', arguments: widget.agenda),
    );
  }
}

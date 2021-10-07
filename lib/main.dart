import 'package:agendas/pages/AboutContact.dart';
import 'package:agendas/pages/Contact.dart';
import 'package:agendas/pages/newContact.dart';
import 'package:agendas/provide/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AgendaProvider())
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (_) => MyHomePage(),
          '/about': (_) => About(),
          '/newContact': (_) => newContacto(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'noticias.dart';
import 'cambiomonedas.dart';
import 'listatareas.dart';
import 'podcast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Ceutec',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 0, 0)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _currentPage = Placeholder(); // Página actualmente mostrada

  @override
  void initState() {
    super.initState();
    // La página inicial es Noticias
    _currentPage = Noticias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de Ceutec'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Menu principal',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 25,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('Noticias'),
              onTap: () {
                setState(() {
                  _currentPage = Noticias();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('El cambio de monedas'),
              onTap: () {
                setState(() {
                  _currentPage = CambioMonedas();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Lista de tareas'),
              onTap: () {
                setState(() {
                  _currentPage = ListaTareas();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.audiotrack),
              title: Text('Podcast'),
              onTap: () {
                setState(() {
                  _currentPage = Podcast();
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _currentPage, // Mostrar la página actual
    );
  }
}

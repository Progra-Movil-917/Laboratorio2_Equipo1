import 'package:flutter/material.dart';
import 'noticias.dart';
import 'cambiomonedas.dart';
import 'listatareas.dart';
import 'podcast.dart';

class MenuP1 extends StatelessWidget {
  const MenuP1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Ceutec',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 0, 0)),
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
  int _selectedIndex = 0; // Índice del elemento seleccionado en el Drawer
  List<Widget> _pages = [
    Noticias(),
    CambioMonedas(),
    ListaTareas(),
    Podcast(),
  ]; // Lista de páginas correspondientes a cada elemento del Drawer

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
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'Menu principal',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
              tileColor:
                  _selectedIndex == 0 ? Colors.grey.withOpacity(0.5) : null,
              selectedTileColor: Colors.grey.withOpacity(0.5),
              leading: const Icon(Icons.article),
              title: const Text('Noticias'),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
              tileColor:
                  _selectedIndex == 1 ? Colors.grey.withOpacity(0.5) : null,
              selectedTileColor: Colors.grey.withOpacity(0.5),
              leading: const Icon(Icons.attach_money),
              title: const Text('El cambio de monedas'),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
              tileColor:
                  _selectedIndex == 2 ? Colors.grey.withOpacity(0.5) : null,
              selectedTileColor: Colors.grey.withOpacity(0.5),
              leading: const Icon(Icons.assignment),
              title: const Text('Lista de tareas'),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
                Navigator.pop(context);
              },
              tileColor:
                  _selectedIndex == 3 ? Colors.grey.withOpacity(0.5) : null,
              selectedTileColor: Colors.grey.withOpacity(0.5),
              leading: const Icon(Icons.audiotrack),
              title: const Text('Podcast'),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

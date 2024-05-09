import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universidad App',
      initialRoute: '/',
      routes: {
        '/': (context) => MainMenu(),
        '/news': (context) => NewsPage(),
        '/tasks': (context) => TaskListPage(),
        '/currency': (context) => CurrencyConverterPage(),
      },
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menú Principal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/news');
              },
              child: Text('Noticias'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tasks');
              },
              child: Text('Lista de Tareas'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/currency');
              },
              child: Text('Cambio de Moneda'),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Noticias')),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.new_releases),
              title: Text('Título de la noticia'),
              subtitle: Text('Descripción de la noticia'),
              // Puedes incluir una imagen con Image.network() aquí
            ),
          ),
          // Otras noticias similares
        ],
      ),
    );
  }
}

class TaskListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tareas')),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Tarea 1'),
            subtitle: Text('Descripción de la tarea'),
          ),
          // Otras tareas pendientes
        ],
      ),
    );
  }
}

class CurrencyConverterPage extends StatefulWidget {
  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  double amount = 0.0;
  String selectedCurrency = 'Lempiras';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cambio de Moneda')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  amount = double.tryParse(value) ?? 0.0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Cantidad en $selectedCurrency',
              ),
            ),
            DropdownButton<String>(
              value: selectedCurrency,
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                  // Lógica de conversión
                  if (selectedCurrency == 'Lempiras') {
                    result = 'Equivalente en dólares: \$${(amount / 24.5).toStringAsFixed(2)}';
                  } else {
                    result = 'Equivalente en Lempiras: L.${(amount * 24.5).toStringAsFixed(2)}';
                  }
                });
              },
              items: <String>['Lempiras', 'Dólares'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Text(result),
          ],
        ),
     ),
);
}
}
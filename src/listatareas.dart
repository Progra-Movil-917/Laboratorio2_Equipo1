import 'package:flutter/material.dart';

class ListaTareas extends StatefulWidget {
  @override
  _ListaTareasState createState() => _ListaTareasState();
}

class _ListaTareasState extends State<ListaTareas> {
  List<bool> _tareasTerminadas = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tareas'),
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: _tareasTerminadas.length,
        itemBuilder: (context, index) {
          return ActividadItem(
            nombre: 'Tarea ${index + 1}',
            descripcion: _obtenerDescripcion(index + 1),
            icono: Icons.assignment,
            color: Colors.blue,
            terminada: _tareasTerminadas[index],
            onToggle: (value) {
              setState(() {
                _tareasTerminadas[index] = value!;
              });
            },
          );
        },
      ),
    );
  }

  String _obtenerDescripcion(int index) {
    switch (index) {
      case 1:
        return 'Resolver ejercicios del capítulo 5';
      case 2:
        return 'Participar en la discusión sobre la Segunda Guerra Mundial';
      case 3:
        return 'Repasar los temas de genética y ecología';
      case 4:
        return 'Leer el capítulo 8 del libro "Cien años de soledad"';
      case 5:
        return 'Preparar la presentación sobre inteligencia artificial';
      case 6:
        return 'Ensayar la pieza de piano para el recital de fin de mes';
      default:
        return '';
    }
  }
}

class ActividadItem extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final IconData icono;
  final Color color;
  final bool terminada;
  final ValueChanged<bool?>? onToggle;

  ActividadItem({
    required this.nombre,
    required this.descripcion,
    required this.icono,
    required this.color,
    required this.terminada,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(
          icono,
          color: color,
        ),
        title: Text(
          nombre,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(descripcion),
        trailing: Checkbox(
          value: terminada,
          onChanged: onToggle,
          activeColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

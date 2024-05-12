import 'package:flutter/material.dart';

class ListaTareas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tareas'),
      ),
      body: ListView(
        children: <Widget>[
          ActividadItem(
            nombre: 'Tarea de Matemáticas',
            descripcion: 'Resolver ejercicios del capítulo 5',
          ),
          ActividadItem(
            nombre: 'Foro de Historia',
            descripcion: 'Participar en la discusión sobre la Segunda Guerra Mundial',
          ),
          ActividadItem(
            nombre: 'Examen de Biología',
            descripcion: 'Repasar los temas de genética y ecología',
          ),
          // Agrega más ActividadItem según sea necesario
        ],
      ),
    );
  }
}

class ActividadItem extends StatelessWidget {
  final String nombre;
  final String descripcion;

  ActividadItem({
    required this.nombre,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nombre),
      subtitle: Text(descripcion),
      // Puedes agregar más contenido o acciones aquí, como botones para marcar como completado, etc.
    );
  }
}

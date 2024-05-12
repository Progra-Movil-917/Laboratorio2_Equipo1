import 'package:flutter/material.dart';

class Noticias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lista de noticias con datos de ejemplo (título, descripción e imagen)
    final List<Map<String, dynamic>> noticias = [
      {
        'titulo': 'Inicia la 6ta convocatoria',
        'descripcion':
            'La universidad inaugura por sexta vez la convocatoria de lectura',
        'imagen': 'src/imagenes/anuncio1.jpg',
      },
      {
        'titulo': 'Cierre de matricula extraordinaria',
        'descripcion':
            'El cierre de matricula sera este 25 de abril, no pierdas la oportunidad de seguir aprendiendo apresurate',
        'imagen': 'src/imagenes/anuncio2.jpg',
      },
      {
        'titulo': 'Copa Ceutec',
        'descripcion':
            'Gran inaugracion de copa Ceutec que contara con invitados especiales.',
        'imagen': 'src/imagenes/anuncio3.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
      ),
      body: ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (context, index) {
          return _buildNoticiaCard(noticias[index]);
        },
      ),
    );
  }

Widget _buildNoticiaCard(Map<String, dynamic> noticia) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0), // Margen vertical aumentado
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contenedor para la imagen
        Expanded(
          flex: 1,
          child: Container(
            height: 100, // Altura deseada de la imagen
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(noticia['imagen']),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Espacio entre la imagen y la información
        SizedBox(width: 8.0),
        // Contenedor para la información
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título de la noticia
                Text(
                  noticia['titulo'],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                // Descripción de la noticia
                Text(
                  noticia['descripcion'],
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}
import 'package:flutter/material.dart';

class CambioMonedas extends StatefulWidget {
  @override
  _CambioMonedasState createState() => _CambioMonedasState();
}

class _CambioMonedasState extends State<CambioMonedas> {
  double cantidad = 0;
  String monedaSeleccionada = 'Dólar';
  double tipoCambio = 24.5; // Tipo de cambio actual en lempiras por dólar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambio de moneda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: monedaSeleccionada,
              onChanged: (String? newValue) {
                setState(() {
                  monedaSeleccionada = newValue!;
                  // Si cambiamos la moneda, ajustamos el tipo de cambio
                  if (monedaSeleccionada == 'Dólar') {
                    tipoCambio = 24.5; // Tipo de cambio actual en lempiras por dólar
                  } else {
                    tipoCambio = 28.8; // Tipo de cambio actual en lempiras por euro
                  }
                });
              },
              items: <String>['Dólar', 'Euro'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cantidad a cambiar',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  cantidad = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'El resultado es: ${calcularCambio()} Lempiras',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  double calcularCambio() {
    return cantidad * tipoCambio;
  }
}

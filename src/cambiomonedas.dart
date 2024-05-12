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
              style: TextStyle(fontSize: 20, color: Colors.black),
              icon: Icon(Icons.arrow_drop_down, size: 30, color: Colors.black),
              elevation: 2,
              isExpanded: true,
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: 'Cantidad a cambiar',
                labelStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  cantidad = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
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

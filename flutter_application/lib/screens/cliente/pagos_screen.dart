import 'package:flutter/material.dart';
import '../../core/constants.dart';

class PagosScreen extends StatelessWidget {
  final List<Map<String, dynamic>> pagos = const [
    {
      "cancha": "Villa Morra - Club de Padel",
      "fecha": "2025-07-01",
      "monto": 150.0,
      "metodo": "Tarjeta",
      "imagen": "assets/villa_morra.png"
    },
    {
      "cancha": "Mburicao Parque Deportivo",
      "fecha": "2025-06-22",
      "monto": 140.0,
      "metodo": "Yape",
      "imagen": "assets/mburicao.png"
    },
    {
      "cancha": "Padel Center",
      "fecha": "2025-06-10",
      "monto": 120.0,
      "metodo": "Plin",
      "imagen": "assets/padel_center.png"
    },
  ];

  const PagosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimarySwatch,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Pagos", style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: pagos.length,
        itemBuilder: (context, i) {
          final pago = pagos[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  pago["imagen"],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                    child: Icon(Icons.image_not_supported, color: Colors.red),
                  ),
                ),
              ),
              title: Text(pago["cancha"], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Fecha: ${pago["fecha"]}\nMétodo: ${pago["metodo"]}"),
              trailing: Text(
                "Gs. ${pago["monto"]}",
                style: TextStyle(color: kPrimarySwatch, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimarySwatch,
        icon: Icon(Icons.payment, color: Colors.white),
        label: Text("Realizar pago", style: TextStyle(color: Colors.white)),
        onPressed: () => showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(18))
          ),
          builder: (context) => MetodoPagoSheet(),
        ),
      ),
    );
  }
}

// Modal para elegir método de pago
class MetodoPagoSheet extends StatefulWidget {
  @override
  State<MetodoPagoSheet> createState() => _MetodoPagoSheetState();
}

class _MetodoPagoSheetState extends State<MetodoPagoSheet> {
  String? metodoSeleccionado;
  String tipoTarjeta = "Débito";

  final _numTarjetaController = TextEditingController();
  final _nombreController = TextEditingController();
  final _fechaController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Container(
              width: 38, height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300], borderRadius: BorderRadius.circular(4)
              ),
            )),
            const SizedBox(height: 14),
            Text("Elegí tu medio de pago", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 22),
            for (final metodo in ["Yape", "Plin", "Tarjeta"])
              RadioListTile<String>(
                activeColor: kPrimarySwatch,
                title: Text(metodo),
                value: metodo,
                groupValue: metodoSeleccionado,
                onChanged: (value) => setState(() => metodoSeleccionado = value),
              ),
            if (metodoSeleccionado == "Tarjeta") ...[
              Row(
                children: [
                  ChoiceChip(
                    label: Text("Débito"),
                    selected: tipoTarjeta == "Débito",
                    onSelected: (selected) => setState(() => tipoTarjeta = "Débito"),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: Text("Crédito"),
                    selected: tipoTarjeta == "Crédito",
                    onSelected: (selected) => setState(() => tipoTarjeta = "Crédito"),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _numTarjetaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Número de tarjeta",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: "Nombre del titular",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _fechaController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: "Vencimiento (MM/AA)",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _cvvController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "CVV",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            if (metodoSeleccionado == "Yape") ...[
              const SizedBox(height: 16),
              Text("Realiza tu pago escaneando el QR Yape", style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Center(child: Icon(Icons.qr_code, size: 80, color: kPrimarySwatch)),
              const SizedBox(height: 6),
              Center(child: Text("N° Yape: 999-999-999")),
            ],
            if (metodoSeleccionado == "Plin") ...[
              const SizedBox(height: 16),
              Text("Realiza tu pago escaneando el QR Plin", style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Center(child: Icon(Icons.qr_code, size: 80, color: kPrimarySwatch)),
              const SizedBox(height: 6),
              Center(child: Text("N° Plin: 888-888-888")),
            ],
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimarySwatch,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: metodoSeleccionado == null ? null : () {
                  // Aquí va la lógica de pago real
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Pago realizado por $metodoSeleccionado"))
                  );
                },
                child: Text("Pagar", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
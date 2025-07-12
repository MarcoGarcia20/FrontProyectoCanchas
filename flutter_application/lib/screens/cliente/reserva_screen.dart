import 'package:flutter/material.dart';
import '../../core/constants.dart';

class MetodoPagoSheet extends StatefulWidget {
  final double monto;
  final Function onPagoExitoso;

  const MetodoPagoSheet({Key? key, required this.monto, required this.onPagoExitoso}) : super(key: key);

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
            const SizedBox(height: 10),
            Text("Monto a pagar: Gs. ${widget.monto}", style: TextStyle(color: kPrimarySwatch)),
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
                  widget.onPagoExitoso(); // Notifica al padre que el pago fue exitoso
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

class ReservaScreen extends StatefulWidget {
  const ReservaScreen({super.key});

  @override
  State<ReservaScreen> createState() => _ReservaScreenState();
}

class _ReservaScreenState extends State<ReservaScreen> {
  late TextEditingController fechaController;
  bool pagado = false;
  List<bool> horasSeleccionadas = List.generate(18, (_) => false);

  @override
  void initState() {
    super.initState();
    fechaController = TextEditingController(
      text: "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}"
    );
  }

  @override
  void dispose() {
    fechaController.dispose();
    super.dispose();
  }

  // Genera los intervalos de hora
  List<String> getIntervalosHoras() {
    // 06:00-07:00 hasta 23:00-00:00
    return List.generate(18, (i) {
      final inicio = (i + 6).toString().padLeft(2, '0');
      final fin = (i + 7).toString().padLeft(2, '0');
      return "$inicio:00-$fin:00";
    });
  }

  @override
  Widget build(BuildContext context) {
    final cancha = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};
    final monto = double.tryParse(cancha['precio']?.toString() ?? '') ?? 0.0;
    final intervalos = getIntervalosHoras();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimarySwatch,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Reservar Cancha", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Datos de la cancha seleccionada",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 20),
            // Datos de la cancha
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        cancha['imagen'] ?? 'assets/placeholder.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stack) => Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey[300],
                          child: Icon(Icons.image_not_supported, color: Colors.red),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cancha['titulo'] ?? 'Nombre cancha',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          if (cancha['ubicacion'] != null || cancha['distrito'] != null)
                            Text(
                              cancha['ubicacion'] ?? cancha['distrito'] ?? "",
                              style: TextStyle(color: Colors.black54),
                            ),
                          if (cancha['tipo'] != null)
                            Text("Tipo: ${cancha['tipo']}"),
                          if (cancha['precio'] != null)
                            Text("Precio: Gs. ${cancha['precio']}/hora"),
                          if (cancha['disponibilidad'] != null)
                            Text("Disponibilidad: ${cancha['disponibilidad']}"),
                          if (cancha['rating'] != null)
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 16),
                                SizedBox(width: 3),
                                Text(cancha['rating'].toString()),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Completa los datos para tu reserva",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 24),

            // Nombre de la cancha (solo lectura)
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: cancha['titulo'] ?? "Nombre de la cancha",
                filled: true,
                fillColor: Colors.green.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.sports_soccer, color: kPrimarySwatch),
              ),
            ),
            const SizedBox(height: 18),

            // Fecha
            TextField(
              controller: fechaController,
              readOnly: true,
              onTap: () async {
                DateTime now = DateTime.now();
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: now,
                  lastDate: DateTime(now.year + 1),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(primary: kPrimarySwatch),
                      ),
                      child: child!,
                    );
                  },
                );
                if (picked != null) {
                  setState(() {
                    fechaController.text = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                  });
                }
              },
              decoration: InputDecoration(
                hintText: "Fecha (ej. 2025-07-10)",
                filled: true,
                fillColor: Colors.green.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Icon(Icons.calendar_today, color: kPrimarySwatch),
              ),
            ),
            const SizedBox(height: 18),

            // Intervals de horas checklist
            Text(
              "Selecciona los intervalos de horas",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ...intervalos.asMap().entries.map((entry) {
              int idx = entry.key;
              String intervalo = entry.value;
              return CheckboxListTile(
                value: horasSeleccionadas[idx],
                title: Text(intervalo),
                activeColor: kPrimarySwatch,
                onChanged: (val) {
                  setState(() {
                    horasSeleccionadas[idx] = val ?? false;
                  });
                },
              );
            }).toList(),

            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pagado ? kPrimarySwatch : Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: pagado
                    ? () {
                        // Lógica de reservar
                        final horasElegidas = [
                          for (int i = 0; i < horasSeleccionadas.length; i++)
                            if (horasSeleccionadas[i]) intervalos[i]
                        ];
                        if (horasElegidas.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Selecciona al menos un intervalo de hora')),
                          );
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(
                              'Reserva realizada para ${cancha['titulo'] ?? ''} el día ${fechaController.text} en los intervalos: ${horasElegidas.join(', ')}'
                          )),
                        );
                      }
                    : null,
                child: const Text(
                  "Reservar",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                icon: Icon(Icons.payment, color: Colors.white),
                label: Text("Pagar", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if (monto == 0.0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No se puede pagar: monto inválido')),
                    );
                    return;
                  }
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(18))
                    ),
                    builder: (context) => MetodoPagoSheet(
                      monto: monto,
                      onPagoExitoso: () {
                        setState(() {
                          pagado = true;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
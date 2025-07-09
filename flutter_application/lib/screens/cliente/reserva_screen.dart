import 'package:flutter/material.dart';
import '../../core/constants.dart';

class ReservaScreen extends StatelessWidget {
  const ReservaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final canchaController = TextEditingController();
    final fechaController = TextEditingController();
    final horaController = TextEditingController();

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
              "Completa los datos para tu reserva",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: canchaController,
              decoration: InputDecoration(
                hintText: "Nombre de la cancha",
                filled: true,
                fillColor: Colors.green.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: fechaController,
              readOnly: true,
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 1),
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
                  fechaController.text = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
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
            TextField(
              controller: horaController,
              readOnly: true,
              onTap: () async {
                TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  horaController.text = picked.format(context);
                }
              },
              decoration: InputDecoration(
                hintText: "Hora",
                filled: true,
                fillColor: Colors.green.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Icon(Icons.access_time, color: kPrimarySwatch),
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimarySwatch,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // Aquí puedes hacer la lógica de reservar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Reserva realizada con éxito')),
                  );
                },
                child: const Text(
                  "Reservar",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
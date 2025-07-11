import 'package:flutter/material.dart';
import 'package:flutter_application/screens/cliente/perfil_cliente_screen.dart';
import 'package:flutter_application/screens/comunes/elegir_rol_screen.dart';
import 'package:flutter_application/screens/propietario/agregar_cancha_screen.dart';
import 'package:flutter_application/screens/propietario/dashboard_screen.dart';
import 'package:flutter_application/screens/propietario/gestion_canchas_screen.dart';
import 'package:flutter_application/screens/propietario/perfil_screen.dart';
import 'package:flutter_application/screens/propietario/reportes_screen.dart';
import 'package:flutter_application/screens/propietario/reservas_screen.dart';
import 'themes/app_theme.dart';
import 'screens/comunes/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/cliente/home_screen2.dart';
import 'screens/cliente/cancha_detalle_screen.dart';
import 'screens/cliente/reserva_screen.dart';
import 'screens/cliente/historial_reservas_screen.dart';
import 'screens/cliente/pagos_screen.dart';
import 'screens/cliente/comentarios_screen.dart';
import 'screens/configuracion/configuracion_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Alquiler de Canchas de Futbol',
      theme: appTheme, // Usa tu theme centralizado
      initialRoute: '/elige-rol', // Cambia a la ruta inicial deseada
      routes: {
        '/elige-rol': (context) => const EligeRolScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
        '/home': (context) => HomeScreen2(),

        // Cliente
        '/cancha-detalle': (context) => const CanchaDetalleScreen(),
        '/reserva': (context) => const ReservaScreen(),
        '/historial': (context) => const HistorialReservasScreen(),
        '/pagos': (context) => const PagosScreen(),
        '/comentarios': (context) => const ComentariosScreen(),
        '/configuracion': (context) => const ConfiguracionScreen(),
        '/perfil-cliente': (context) => const PerfilClienteScreen(),

        // Propietario
        '/dashboard-prop': (context) => const DashboardPropietarioScreen(),
        '/gestion-canchas': (context) => const GestionCanchasScreen(),
        '/agregar-cancha': (context) => const AgregarCanchaScreen(),
        '/perfil-prop': (context) => const PerfilPropietarioScreen(),
        '/reportes': (context) => const ReportesScreen(),
        '/reservas-prop': (context) => const ReservasPropietarioScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/splash') {
          final args = settings.arguments as String? ?? 'cliente';
          return MaterialPageRoute(
            builder: (context) => SplashScreen(rol: args),
          );
        }
        // Si no es /splash, usa la ruta normal:
        return null;
      },
    );
  }
}

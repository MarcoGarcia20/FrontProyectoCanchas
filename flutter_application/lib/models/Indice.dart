/// Clase abstracta que define la clave primaria (ID) común para entidades.
abstract class Indice {
  final String clave; // Puede ser DNI, ID, etc.

  Indice(this.clave);
}
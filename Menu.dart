import 'dart:io' show stdin, stdout ;
import 'Eliminar.dart' as eliminar;
import 'Listar.dart' as listar;
import 'Agregar.dart' as agregar;
import 'Actualizar.dart' as actualizar;

void main() {
  List<Map<String, dynamic>> pelicula = [];
  int? opcion;

  do {
    print("\nPELICULAS");
    print("1. Agregar pelicula");
    print("2. Listar pelicula");
    print("3. Actualizar pelicula");
    print("4. Eliminar pelicula");
    print("5. Salir");

    stdout.write("Seleccione una opción: ");
    opcion = int.tryParse(stdin.readLineSync() ?? "");

    switch (opcion) {
      case 1:
        agregar.agregarPelicula(pelicula);
        break;

      case 2:
        listar.listarPeliculas(pelicula);
        break;

      case 3:
        actualizar.actualizarPelicula(pelicula);
        break;

      case 4:
        eliminar.eliminar(pelicula);
        break;

      case 5:
        print("Programa finalizado.");
        break;

      default:
        print("Opción inválida. Intente nuevamente.");
    }
  } while (opcion != 5);
  }
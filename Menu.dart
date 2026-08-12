import 'dart:io';
import 'Agregar.dart' as agregar;
import 'Listar.dart' as listar;
import 'Actualizar.dart' as actualizar;
import 'Eliminar.dart' as eliminar;

void main() {
  List<Map<String, dynamic>> peliculas = [];
  int? opcion;

  do {
    print('\n--- MENU PELICULAS ---');
    print('1. Agregar pelicula');
    print('2. Listar peliculas');
    print('3. Actualizar pelicula');
    print('4. Eliminar pelicula');
    print('5. Salir');
    stdout.write('Seleccione una opcion: ');

    opcion = int.tryParse(stdin.readLineSync() ?? '');

    switch (opcion) {
      case 1:
        agregar.agregarPelicula(peliculas);
        break;
      case 2:
        listar.listarPeliculas(peliculas);
        break;
      case 3:
        actualizar.actualizarPelicula(peliculas);
        break;
      case 4:
        eliminar.eliminarPelicula(peliculas);
        break;
      case 5:
        print('Saliendo del programa...');
        break;
      default:
        print('Opcion no valida.');
    }
  } while (opcion != 5);
}
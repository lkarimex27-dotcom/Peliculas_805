import 'dart:io';

void main() {
  List<Map<String, dynamic>> peliculas = [];

  print('       AGREGAR PELÍCULA');

  // Título
  String titulo = '';

  while (titulo.trim().isEmpty) {
    stdout.write('Ingrese el título: ');
    titulo = stdin.readLineSync() ?? '';

    if (titulo.trim().isEmpty) {
      print(' El título no puede estar vacío.');
    }
  }

  // Director
  String director = '';

  while (director.trim().isEmpty) {
    stdout.write('Ingrese el director: ');
    director = stdin.readLineSync() ?? '';

    if (director.trim().isEmpty) {
      print(' El director no puede estar vacío.');
    }
  }

  // Año
  int? anio;

  while (anio == null) {
    stdout.write('Ingrese el año de estreno: ');
    String entrada = stdin.readLineSync() ?? '';

    if (entrada.trim().isEmpty) {
      print(' El año no puede estar vacío.');
      continue;
    }

    try {
      int valor = int.parse(entrada);

      if (valor > 0) {
        anio = valor;
      } else {
        print(' El año debe ser mayor que 0.');
      }
    } catch (e) {
      print(' Debe ingresar un número entero.');
    }
  }

  // Género
  String genero = '';

  while (genero.trim().isEmpty) {
    stdout.write('Ingrese el género: ');
    genero = stdin.readLineSync() ?? '';

    if (genero.trim().isEmpty) {
      print(' El género no puede estar vacío.');
    }
  }

  // Guardar película
  peliculas.add({
    'titulo': titulo.trim(),
    'director': director.trim(),
    'anio': anio,
    'genero': genero.trim(),
  });

  print('\n Película agregada correctamente.');

  print('\nDatos de la película:');
  print('Título: ${peliculas[0]['titulo']}');
  print('Director: ${peliculas[0]['director']}');
  print('Año: ${peliculas[0]['anio']}');
  print('Género: ${peliculas[0]['genero']}');
}

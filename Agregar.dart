import 'dart:io';

void agregarPelicula(List<Map<String, dynamic>> peliculas) {
  print('\n--- AGREGAR PELICULA ---');

  String titulo = '';
  while (titulo.trim().isEmpty) {
    stdout.write('Ingrese el titulo: ');
    titulo = stdin.readLineSync() ?? '';
    if (titulo.trim().isEmpty) {
      print('El titulo no puede estar vacio.');
    }
  }

  String director = '';
  while (director.trim().isEmpty) {
    stdout.write('Ingrese el director: ');
    director = stdin.readLineSync() ?? '';
    if (director.trim().isEmpty) {
      print('El director no puede estar vacio.');
    }
  }

  int? anio;
  while (anio == null) {
    stdout.write('Ingrese el ano de estreno: ');
    String entrada = stdin.readLineSync() ?? '';
    try {
      int valor = int.parse(entrada);
      if (valor > 0) {
        anio = valor;
      } else {
        print('El ano debe ser mayor a 0.');
      }
    } catch (_) {
      print('Ingrese un numero valido.');
    }
  }

  String genero = '';
  while (genero.trim().isEmpty) {
    stdout.write('Ingrese el genero: ');
    genero = stdin.readLineSync() ?? '';
    if (genero.trim().isEmpty) {
      print('El genero no puede estar vacio.');
    }
  }

  peliculas.add({
    'titulo': titulo.trim(),
    'director': director.trim(),
    'anio': anio,
    'genero': genero.trim(),
  });

  print('Pelicula agregada correctamente.');
}
import 'dart:io';

void agregarPelicula(List<Map<String, dynamic>> peliculas) {
  print('\n      AGREGAR PELÍCULA');

  String titulo = '';
  while (titulo.trim().isEmpty) {
    stdout.write('Ingrese el título: ');
    titulo = stdin.readLineSync() ?? '';

    if (titulo.trim().isEmpty) {
      print('El título no puede estar vacío');
    }
  }

  String director = '';
  while (director.trim().isEmpty) {
    stdout.write('Ingrese el director: ');
    director = stdin.readLineSync() ?? '';

    if (director.trim().isEmpty) {
      print('El director no puede estar vacío');
    }
  }

  int? anio;
  while (anio == null) {
    stdout.write('Ingrese el año de estreno: ');
    String entrada = stdin.readLineSync() ?? '';

    try {
      int valor = int.parse(entrada);

      if (valor > 0) {
        anio = valor;
      } else {
        print('El año debe ser mayor que 0');
      }
    } catch (e) {
      print('Debe ingresar un número entero válido');
    }
  }

  String genero = '';
  while (genero.trim().isEmpty) {
    stdout.write('Ingrese el género: ');
    genero = stdin.readLineSync() ?? '';

    if (genero.trim().isEmpty) {
      print('El género no puede estar vacío');
    }
  }

  Map<String, dynamic> pelicula = {
    'titulo': titulo.trim(),
    'director': director.trim(),
    'anio': anio,
    'genero': genero.trim()
  };

  peliculas.add(pelicula);

  print('\nPelícula agregada correctamente:');
  print('• Título:   ${pelicula['titulo']}');
  print('• Director: ${pelicula['director']}');
  print('• Año:      ${pelicula['anio']}');
  print('• Género:   ${pelicula['genero']}');
}


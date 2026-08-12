import 'dart:io';

void main() {
  List<Map<String, dynamic>> peliculas = [
    {
      'titulo': 'Avatar',
      'director': 'James Cameron',
      'anio': 2009,
      'genero': 'Ciencia Ficción',
    },
    {
      'titulo': 'Titanic',
      'director': 'James Cameron',
      'anio': 1997,
      'genero': 'Drama',
    },
    {
      'titulo': 'Avengers',
      'director': 'Anthony Russo',
      'anio': 2019,
      'genero': 'Acción',
    },
  ];

  print('      ACTUALIZAR PELÍCULA');

  // Mostrar películas
  print('\nPelículas disponibles:\n');

  for (int i = 0; i < peliculas.length; i++) {
    print(
      '$i. '
      '${peliculas[i]['titulo']} | '
      '${peliculas[i]['director']} | '
      '${peliculas[i]['anio']} | '
      '${peliculas[i]['genero']}',
    );
  }

  // Solicitar índice
  int? indice;

  while (indice == null) {
    stdout.write('\nIngrese el índice de la película a actualizar: ');

    String entrada = stdin.readLineSync() ?? '';

    try {
      int valor = int.parse(entrada);

      if (valor >= 0 && valor < peliculas.length) {
        indice = valor;
      } else {
        print(' Índice fuera de rango.');
      }
    } catch (e) {
      print(' Debe ingresar un número entero.');
    }
  }

  // Película seleccionada
  Map<String, dynamic> pelicula = peliculas[indice];

  print('        DATOS ACTUALES');

  print('Título: ${pelicula['titulo']}');
  print('Director: ${pelicula['director']}');
  print('Año: ${pelicula['anio']}');
  print('Género: ${pelicula['genero']}');

  print('        ACTUALIZAR DATOS');

  print('Presione ENTER para conservar el dato anterior.\n');

  // Actualizar título
  stdout.write('Nuevo título: ');
  String titulo = stdin.readLineSync() ?? '';

  if (titulo.trim().isNotEmpty) {
    pelicula['titulo'] = titulo.trim();
  }

  // Actualizar director
  stdout.write('Nuevo director: ');
  String director = stdin.readLineSync() ?? '';

  if (director.trim().isNotEmpty) {
    pelicula['director'] = director.trim();
  }

  // Actualizar año
  while (true) {
    stdout.write('Nuevo año: ');
    String entradaAnio = stdin.readLineSync() ?? '';

    // ENTER = conservar dato anterior
    if (entradaAnio.trim().isEmpty) {
      break;
    }

    try {
      int nuevoAnio = int.parse(entradaAnio);

      if (nuevoAnio > 0) {
        pelicula['anio'] = nuevoAnio;
        break;
      } else {
        print(' El año debe ser mayor que 0.');
      }
    } catch (e) {
      print(' Debe ingresar un número entero.');
    }
  }

  // Actualizar género
  stdout.write('Nuevo género: ');
  String genero = stdin.readLineSync() ?? '';

  if (genero.trim().isNotEmpty) {
    pelicula['genero'] = genero.trim();
  }

  print('    PELÍCULA ACTUALIZADA');

  print('Título: ${pelicula['titulo']}');
  print('Director: ${pelicula['director']}');
  print('Año: ${pelicula['anio']}');
  print('Género: ${pelicula['genero']}');

  print('\n Actualización realizada correctamente.');
}

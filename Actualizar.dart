import 'dart:io';

void main() {
  List<Map<String, dynamic>> peliculas = [
    {
      'titulo': 'Matrix',
      'director': 'Lana Wachowski',
      'anio': 1999,
      'genero': 'Ciencia Ficción'
    }
  ];

  print('Películas disponibles');

  for (int i = 0; i < peliculas.length; i++) {
    print(
      '$i. ${peliculas[i]['titulo']} - '
      '${peliculas[i]['director']} - '
      '${peliculas[i]['anio']} - '
      '${peliculas[i]['genero']}'
    );
  }

  int? indice;

  while (indice == null) {
    stdout.write('Ingrese el índice de la película: ');
    String entrada = stdin.readLineSync() ?? '';

    try {
      int valor = int.parse(entrada);

      if (valor >= 0 && valor < peliculas.length) {
        indice = valor;
      } else {
        print('Índice fuera de rango');
      }
    } catch (e) {
      print('Debe ingresar un número');
    }
  }

  Map<String, dynamic> pelicula = peliculas[indice!];

  print('\nDatos actuales');
  print('Título: ${pelicula['titulo']}');
  print('Director: ${pelicula['director']}');
  print('Año: ${pelicula['anio']}');
  print('Género: ${pelicula['genero']}');

  print('\nSi no quiere cambiar un dato, presione ENTER');

  stdout.write('Nuevo título: ');
  String titulo = stdin.readLineSync() ?? '';

  if (titulo.trim().isNotEmpty) {
    pelicula['titulo'] = titulo.trim();
  }

  stdout.write('Nuevo director: ');
  String director = stdin.readLineSync() ?? '';

  if (director.trim().isNotEmpty) {
    pelicula['director'] = director.trim();
  }

  while (true) {
    stdout.write('Nuevo año: ');
    String entradaAnio = stdin.readLineSync() ?? '';

    if (entradaAnio.trim().isEmpty) {
      break;
    }

    try {
      int nuevoAnio = int.parse(entradaAnio);

      if (nuevoAnio > 0) {
        pelicula['anio'] = nuevoAnio;
        break;
      } else {
        print('El año debe ser mayor que 0');
      }
    } catch (e) {
      print('Debe ingresar un número');
    }
  }

  stdout.write('Nuevo género: ');
  String genero = stdin.readLineSync() ?? '';

  if (genero.trim().isNotEmpty) {
    pelicula['genero'] = genero.trim();
  }

  print('\nPelícula actualizada');
  print('Título: ${pelicula['titulo']}');
  print('Director: ${pelicula['director']}');
  print('Año: ${pelicula['anio']}');
  print('Género: ${pelicula['genero']}');
}
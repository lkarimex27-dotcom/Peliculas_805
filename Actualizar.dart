import 'dart:io';

void actualizarPelicula(List<Map<String, dynamic>> peliculas) {

  if (peliculas.isEmpty) {
    print('\nNo hay películas registradas para actualizar.');
    return;
  }

  print('\n      PELÍCULAS DISPONIBLES');

  for (int i = 0; i < peliculas.length; i++) {
    print(
      '$i. ${peliculas[i]['titulo']} - '
      '${peliculas[i]['director']} - '
      '${peliculas[i]['anio']} - '
      '${peliculas[i]['genero']}'
    );
  }

  int? indice;

  // 3. Selección del índice
  while (indice == null) {
    stdout.write('\nIngrese el índice de la película a actualizar: ');
    String entrada = stdin.readLineSync() ?? '';

    try {
      int valor = int.parse(entrada);

      if (valor >= 0 && valor < peliculas.length) {
        indice = valor;
      } else {
        print('❌ Índice fuera de rango.');
      }
    } catch (e) {
      print('❌ Debe ingresar un número entero válido.');
    }
  }

  Map<String, dynamic> pelicula = peliculas[indice!];

  print('\nDatos actuales:');
  print('Título:   ${pelicula['titulo']}');
  print('Director: ${pelicula['director']}');
  print('Año:      ${pelicula['anio']}');
  print('Género:   ${pelicula['genero']}');

  print('\n(Si no desea modificar un campo, presione ENTER)');

  // Título
  stdout.write('Nuevo título: ');
  String titulo = stdin.readLineSync() ?? '';
  if (titulo.trim().isNotEmpty) {
    pelicula['titulo'] = titulo.trim();
  }

  // Director
  stdout.write('Nuevo director: ');
  String director = stdin.readLineSync() ?? '';
  if (director.trim().isNotEmpty) {
    pelicula['director'] = director.trim();
  }

  // Año
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
        print('❌ El año debe ser mayor que 0.');
      }
    } catch (e) {
      print('❌ Debe ingresar un número válido.');
    }
  }

  // Género
  stdout.write('Nuevo género: ');
  String genero = stdin.readLineSync() ?? '';
  if (genero.trim().isNotEmpty) {
    pelicula['genero'] = genero.trim();
  }

  print('\n✅ Película actualizada correctamente:');
  print('• Título:   ${pelicula['titulo']}');
  print('• Director: ${pelicula['director']}');
  print('• Año:      ${pelicula['anio']}');
  print('• Género:   ${pelicula['genero']}');
}
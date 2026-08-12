import 'dart:io';

void actualizarPelicula(List<Map<String, dynamic>> peliculas) {
  if (peliculas.isEmpty) {
    print('\nNo hay peliculas para actualizar.');
    return;
  }

  print('\n--- ACTUALIZAR PELICULA ---');
  for (int i = 0; i < peliculas.length; i++) {
    print('$i. ${peliculas[i]['titulo']} - ${peliculas[i]['director']}');
  }

  int? indice;
  while (indice == null) {
    stdout.write('\nIngrese el indice de la pelicula a actualizar: ');
    String entrada = stdin.readLineSync() ?? '';
    try {
      int valor = int.parse(entrada);
      if (valor >= 0 && valor < peliculas.length) {
        indice = valor;
      } else {
        print('Indice fuera de rango.');
      }
    } catch (_) {
      print('Ingrese un numero valido.');
    }
  }

  Map<String, dynamic> pelicula = peliculas[indice!];
  print('\nPresione ENTER si no desea modificar un campo.');

  stdout.write('Nuevo titulo [${pelicula['titulo']}]: ');
  String titulo = stdin.readLineSync() ?? '';
  if (titulo.trim().isNotEmpty) {
    pelicula['titulo'] = titulo.trim();
  }

  stdout.write('Nuevo director [${pelicula['director']}]: ');
  String director = stdin.readLineSync() ?? '';
  if (director.trim().isNotEmpty) {
    pelicula['director'] = director.trim();
  }

  while (true) {
    stdout.write('Nuevo ano [${pelicula['anio']}]: ');
    String entradaAnio = stdin.readLineSync() ?? '';
    if (entradaAnio.trim().isEmpty) break;
    try {
      int nuevoAnio = int.parse(entradaAnio);
      if (nuevoAnio > 0) {
        pelicula['anio'] = nuevoAnio;
        break;
      } else {
        print('El ano debe ser mayor a 0.');
      }
    } catch (_) {
      print('Ingrese un numero valido.');
    }
  }

  stdout.write('Nuevo genero [${pelicula['genero']}]: ');
  String genero = stdin.readLineSync() ?? '';
  if (genero.trim().isNotEmpty) {
    pelicula['genero'] = genero.trim();
  }

  print('Pelicula actualizada.');
}
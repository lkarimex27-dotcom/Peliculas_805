import 'dart:io';

void eliminarPelicula(List<Map<String, dynamic>> peliculas) {
  if (peliculas.isEmpty) {
    print('\nNo hay peliculas para eliminar.');
    return;
  }

  print('\n--- ELIMINAR PELICULA ---');
  for (int i = 0; i < peliculas.length; i++) {
    print('$i. ${peliculas[i]['titulo']} - ${peliculas[i]['director']}');
  }

  int? indice;
  while (indice == null) {
    stdout.write('\nIngrese el indice de la pelicula a eliminar: ');
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

  Map<String, dynamic> eliminada = peliculas.removeAt(indice!);
  print('Pelicula "${eliminada['titulo']}" eliminada.');
}
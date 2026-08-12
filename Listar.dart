import 'dart:io';

void listarPeliculas(List<Map<String, dynamic>> peliculas) {
  if (peliculas.isEmpty) {
    print('\nNo hay películas registradas.');
    return;
  }

  print('\n      LISTA DE PELÍCULAS');
  for (var i = 0; i < peliculas.length; i++) {
    print('------------------------------------');
    print('Película #${i + 1}'); // Muestra la posición comenzando desde 1
    print('Título:         ${peliculas[i]['titulo']}');
    print('Director:       ${peliculas[i]['director']}');
    print('Año de estreno: ${peliculas[i]['anio']}');
    print('Género:         ${peliculas[i]['genero']}');
  }
}
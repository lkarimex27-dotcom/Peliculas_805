import 'dart:io';

void listarPeliculas(List<Map<String, dynamic>> peliculas) {
  if (peliculas.isEmpty) {
    print('\nNo hay peliculas registradas.');
    return;
  }

  print('\n--- LISTA DE PELICULAS ---');
  for (int i = 0; i < peliculas.length; i++) {
    print('Indice: $i');
    print('Titulo: ${peliculas[i]['titulo']}');
    print('Director: ${peliculas[i]['director']}');
    print('Ano: ${peliculas[i]['anio']}');
    print('Genero: ${peliculas[i]['genero']}');
    print('-----------------------');
  }
}
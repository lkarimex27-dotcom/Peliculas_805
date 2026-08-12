import 'dart:io';

void eliminar(List<Map<String, dynamic>> peliculas) {
  
  for (var i = 0; i < peliculas.length; i++) {
    print('Número de índice: ${peliculas[i]['id']}');
    print('Título: ${peliculas[i]['title']}');
    print('Director: ${peliculas[i]['director']}');
    print('Año de estreno: ${peliculas[i]['year']}');
    print('Género: ${peliculas[i]['genre']}');
    print('');
  }
  
}
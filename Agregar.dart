import 'dart:io';
import 'dart:convert';

void main() {
  print('       AGREGAR PELÍCULA');

  // Leer las películas que ya existen
  List<Map<String, dynamic>> peliculas = cargarPeliculas();

  // TÍTULO

  String titulo = '';

  while (titulo.trim().isEmpty) {
    stdout.write('Ingrese el título: ');
    titulo = stdin.readLineSync() ?? '';

    if (titulo.trim().isEmpty) {
      print(' El título no puede estar vacío.');
    }
  }

  // DIRECTOR

  String director = '';

  while (director.trim().isEmpty) {
    stdout.write('Ingrese el director: ');
    director = stdin.readLineSync() ?? '';

    if (director.trim().isEmpty) {
      print(' El director no puede estar vacío.');
    }
  }

  
  // AÑO

  int? anio;

  while (anio == null) {
    stdout.write('Ingrese el año de estreno: ');

    String entrada = stdin.readLineSync() ?? '';

    if (entrada.trim().isEmpty) {
      print(' El año no puede estar vacío.');
      continue;
    }

    try {
      int valor = int.parse(entrada);

      if (valor > 0) {
        anio = valor;
      } else {
        print(' El año debe ser mayor que 0.');
      }
    } catch (e) {
      print(' Debe ingresar un número entero.');
    }
  }

  // GÉNERO

  String genero = '';

  while (genero.trim().isEmpty) {
    stdout.write('Ingrese el género: ');
    genero = stdin.readLineSync() ?? '';

    if (genero.trim().isEmpty) {
      print(' El género no puede estar vacío.');
    }
  }

  // CREAR MAPA DE LA PELÍCULA

  Map<String, dynamic> pelicula = {
    'titulo': titulo.trim(),
    'director': director.trim(),
    'anio': anio,
    'genero': genero.trim(),
  };

  // Agregar la película a la lista
  peliculas.add(pelicula);

  // Guardar la lista
  guardarPeliculas(peliculas);

  print(' PELÍCULA AGREGADA');

  print('Título: ${pelicula['titulo']}');
  print('Director: ${pelicula['director']}');
  print('Año: ${pelicula['anio']}');
  print('Género: ${pelicula['genero']}');

  print('\n La película quedó guardada correctamente.');
}

// CARGAR PELÍCULAS

List<Map<String, dynamic>> cargarPeliculas() {
  File archivo = File('peliculas.json');

  // Si el archivo no existe, devuelve una lista vacía
  if (!archivo.existsSync()) {
    return [];
  }

  try {
    String contenido = archivo.readAsStringSync();

    if (contenido.trim().isEmpty) {
      return [];
    }

    List<dynamic> datos = jsonDecode(contenido);

    return datos
        .map((pelicula) => Map<String, dynamic>.from(pelicula))
        .toList();
  } catch (e) {
    print(' Error al cargar las películas.');
    return [];
  }
}

// GUARDAR PELÍCULAS

void guardarPeliculas(List<Map<String, dynamic>> peliculas) {
  File archivo = File('peliculas.json');

  String contenido = jsonEncode(peliculas);

  archivo.writeAsStringSync(contenido);
}
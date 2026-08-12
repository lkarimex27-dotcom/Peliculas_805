import 'dart:io';
import 'dart:convert';

void main() {
  print('      ACTUALIZAR PELÍCULA');

  // Cargar las películas guardadas
  List<Map<String, dynamic>> peliculas = cargarPeliculas();

  
  // VERIFICAR SI HAY PELÍCULAS

  if (peliculas.isEmpty) {
    print('\n No hay películas registradas.');
    print('Primero debes agregar una película.');
    return;
  }

  // MOSTRAR PELÍCULAS

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

  // SOLICITAR ÍNDICE

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

  // OBTENER PELÍCULA

  Map<String, dynamic> pelicula = peliculas[indice!];

  print('        DATOS ACTUALES');

  print('Título: ${pelicula['titulo']}');
  print('Director: ${pelicula['director']}');
  print('Año: ${pelicula['anio']}');
  print('Género: ${pelicula['genero']}');

  print('       ACTUALIZAR DATOS');

  print('Presione ENTER para conservar el dato anterior.\n');

  // ACTUALIZAR TÍTULO

  stdout.write('Nuevo título: ');

  String nuevoTitulo = stdin.readLineSync() ?? '';

  if (nuevoTitulo.trim().isNotEmpty) {
    pelicula['titulo'] = nuevoTitulo.trim();
  }

  // ACTUALIZAR DIRECTOR

  stdout.write('Nuevo director: ');

  String nuevoDirector = stdin.readLineSync() ?? '';

  if (nuevoDirector.trim().isNotEmpty) {
    pelicula['director'] = nuevoDirector.trim();
  }

  // ACTUALIZAR AÑO

  while (true) {
    stdout.write('Nuevo año: ');

    String entradaAnio = stdin.readLineSync() ?? '';

    // ENTER = conservar el año anterior
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

  // ACTUALIZAR GÉNERO

  stdout.write('Nuevo género: ');

  String nuevoGenero = stdin.readLineSync() ?? '';

  if (nuevoGenero.trim().isNotEmpty) {
    pelicula['genero'] = nuevoGenero.trim();
  }

  // GUARDAR CAMBIOS

  guardarPeliculas(peliculas);

  print('    PELÍCULA ACTUALIZADA');

  print('Título: ${pelicula['titulo']}');
  print('Director: ${pelicula['director']}');
  print('Año: ${pelicula['anio']}');
  print('Género: ${pelicula['genero']}');

  print('\n Actualización realizada correctamente.');
}

// CARGAR PELÍCULAS

List<Map<String, dynamic>> cargarPeliculas() {
  File archivo = File('peliculas.json');

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
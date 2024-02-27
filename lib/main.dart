// Importamos el paquete flutter/material.dart, que contiene widgets y utilidades para construir aplicaciones de Flutter.
import 'package:flutter/material.dart';

// La función main es el punto de entrada de la aplicación Flutter.
void main() {
  // Llamamos a runApp() para iniciar la aplicación. Pasamos una instancia de ListaTareasApp, que es un widget que representa la aplicación.
  runApp(ListaTareasApp());
}

// ListaTareasApp es un widget StatelessWidget que representa toda la aplicación.
class ListaTareasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Configuramos el título de la aplicación.
      title: 'Lista de Tareas',
      // Configuramos el tema de la aplicación.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Establecemos el color primario como azul.
      ),
      // Configuramos el widget que será la pantalla inicial de la aplicación.
      home: ListaTareasScreen(),
    );
  }
}

// ListaTareasScreen es un StatefulWidget que representa la pantalla principal de la aplicación.
class ListaTareasScreen extends StatefulWidget {
  @override
  _ListaTareasScreenState createState() => _ListaTareasScreenState();
}

// _ListaTareasScreenState es la clase de estado correspondiente a ListaTareasScreen.
class _ListaTareasScreenState extends State<ListaTareasScreen> {
  // Declaramos una lista de cadenas para almacenar las tareas.
  List<String> tareas = ['Tarea 1', 'Tarea 2', 'Tarea 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold es un widget que proporciona una estructura visual básica para la pantalla, como el AppBar y el FloatingActionButton.
      appBar: AppBar(
        // AppBar muestra una barra de aplicación en la parte superior de la pantalla.
        title: Text('Lista de Tareas'), // Título de la barra de aplicación.
      ),
      body: ListView.builder(
        // ListView.builder construye una lista de widgets bajo demanda.
        itemCount: tareas.length, // Establecemos la cantidad de elementos en la lista.
        itemBuilder: (context, index) {
          return ListTile(
            // ListTile muestra un elemento de la lista con un título opcional, contenido y una acción opcional.
            title: Text(tareas[index]), // Título de la tarea.
            trailing: IconButton(
              // IconButton es un botón que muestra un icono.
              icon: Icon(Icons.check_circle), // Icono de marca de verificación.
              onPressed: () {
                // Definimos la acción al presionar el botón.
                setState(() {
                  // setState marca que el estado del widget ha cambiado y solicita una reconstrucción de la interfaz de usuario.
                  tareas.removeAt(index); // Eliminamos la tarea de la lista.
                });
              },
            ),
            onLongPress: () {
              // Definimos la acción al mantener presionado el elemento de la lista.
              setState(() {
                tareas.removeAt(index); // Eliminamos la tarea de la lista.
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // FloatingActionButton es un botón circular de acción flotante.
        onPressed: () {
          // Definimos la acción al presionar el botón.
          _mostrarDialogoAgregarTarea(context); // Mostramos un diálogo para agregar una nueva tarea.
        },
        tooltip: 'Agregar Tarea', // Texto que se muestra al mantener el cursor sobre el botón.
        child: Icon(Icons.add), // Icono del botón.
      ),
    );
  }

  void _mostrarDialogoAgregarTarea(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar Tarea'), // Título del diálogo.
          content: TextField(
            // Campo de texto para ingresar el nombre de la nueva tarea.
            controller: _controller, // Controlador para acceder al texto ingresado.
            decoration: InputDecoration(hintText: 'Nombre de la tarea'), // Texto de ayuda en el campo de texto.
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Definimos la acción al presionar el botón de agregar.
                setState(() {
                  // Actualizamos el estado para reflejar la nueva tarea agregada.
                  tareas.add(_controller.text); // Agregamos la nueva tarea a la lista.
                });
                Navigator.pop(context); // Cerramos el diálogo.
              },
              child: Text('Agregar'), // Texto del botón de agregar.
            ),
            TextButton(
              onPressed: () {
                // Definimos la acción al presionar el botón de cancelar.
                Navigator.pop(context); // Cerramos el diálogo.
              },
              child: Text('Cancelar'), // Texto del botón de cancelar.
            ),
          ],
        );
      },
    );
  }
}
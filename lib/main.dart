import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OMEYO',
      theme: ThemeData(
        // Usamos Material 3 para un diseño más moderno
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const ProductosPage(),
    );
  }
}

class ProductosPage extends StatelessWidget {
  const ProductosPage({super.key});

  // Lista tipada correctamente para evitar problemas de lectura de datos
  final List<Map<String, dynamic>> productos = const [
    {"nombre": "Servicio de Plomería", "precio": 25, "icono": Icons.plumbing},
    {"nombre": "Servicio Eléctrico", "precio": 40, "icono": Icons.flash_on},
    {"nombre": "Reparación de Gas", "precio": 35, "icono": Icons.local_fire_department},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "OMEYO - Servicios", 
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: productos.length,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        itemBuilder: (context, index) {
          final producto = productos[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                backgroundColor: Colors.teal.withOpacity(0.1),
                child: Icon(producto['icono'], color: Colors.teal),
              ),
              title: Text(
                producto['nombre'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  "\$${producto['precio']}.00",
                  style: const TextStyle(
                    fontSize: 16, 
                    color: Colors.green, 
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart, color: Colors.teal),
                onPressed: () {
                  // Aquí pondremos la lógica para agregar al carrito más adelante
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${producto['nombre']} agregado al carrito'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
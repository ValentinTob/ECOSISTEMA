class Usuario {
  int id;
  String nombre;
  int edad;

  Usuario({
    required this.id,
    required this.nombre,
    required this.edad,
  });

  // Método para convertir un Usuario a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'edad': edad,
    };
  }

  // Método para crear un Usuario desde un Map
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nombre: map['nombre'],
      edad: map['edad'],
    );
  }
}

class Producto {
  String nombre;
  DateTime fechaVencimiento;
  double precio;

  Producto(this.nombre, this.precio, this.fechaVencimiento);
}

class Venta {
  List<Producto> productos = [];

  void agregarProducto(Producto producto) {
    productos.add(producto);
  }

  double calcularTotal() {
    double total = 0.0;

    for (var producto in productos) {
      if (producto.fechaVencimiento.isBefore(DateTime.now().add(Duration(days: 15)))) {
        total += producto.precio * 0.15;
      } else {
        total += producto.precio;
      }
    }

    return total;
  }
}

void main() {
  var venta = Venta();

  venta.agregarProducto(Producto('Producto 1', 100.0, DateTime(2023, 10, 1)));
  venta.agregarProducto(Producto('Producto 2', 50.0, DateTime(2023, 9, 16)));

  var total = venta.calcularTotal();
  print('Total a pagar: \$${total.toStringAsFixed(2)}');
}












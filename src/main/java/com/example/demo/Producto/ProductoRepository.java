package com.example.demo.Producto;

import java.util.List;

public interface ProductoRepository {
    List<Producto> listar();
    List<Producto> listarDisponibles();
    Producto obtenerPorId(int id);
    void registrar(Producto producto);
    void actualizar(Producto producto);
    void cambiarDisponibilidad(int id);
    boolean eliminar(int id);
}

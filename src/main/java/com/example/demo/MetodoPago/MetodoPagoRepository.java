package com.example.demo.MetodoPago;

import java.util.List;

public interface MetodoPagoRepository {
    List<MetodoPago> listar();
    List<MetodoPago> listarActivos();
    MetodoPago obtenerPorId(int id);
    void registrar(MetodoPago metodoPago);
    void actualizar(MetodoPago metodoPago);
    void deshabilitar(int id);
    void habilitar(int id);
    boolean eliminar(int id);
}

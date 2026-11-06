package com.example.demo.Categoria;

import java.util.List;

public interface CategoriaService {
    List<Categoria> listar();
    List<Categoria> listarActivas();
    Categoria obtenerPorId(int id);
    void registrar(Categoria categoria);
    void actualizar(Categoria categoria);
    void deshabilitar(int id);
    void habilitar(int id);
    boolean eliminar(int id);
}

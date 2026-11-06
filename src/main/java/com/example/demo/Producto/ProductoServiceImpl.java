package com.example.demo.Producto;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class ProductoServiceImpl implements ProductoService {

    private final ProductoRepository repository;

    public ProductoServiceImpl(ProductoRepository repository) {
        this.repository = repository;
    }

    public List<Producto> listar() {
        return repository.listar();
    }

    public List<Producto> listarDisponibles() {
        return repository.listarDisponibles();
    }

    public Producto obtenerPorId(int id) {
        return repository.obtenerPorId(id);
    }

    public void registrar(Producto producto) {
        repository.registrar(producto);
    }

    public void actualizar(Producto producto) {
        repository.actualizar(producto);
    }

    public void cambiarDisponibilidad(int id) {
        repository.cambiarDisponibilidad(id);
    }

    public boolean eliminar(int id) {
        return repository.eliminar(id);
    }
}

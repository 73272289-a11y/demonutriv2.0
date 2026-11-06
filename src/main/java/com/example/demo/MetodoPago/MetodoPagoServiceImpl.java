package com.example.demo.MetodoPago;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class MetodoPagoServiceImpl implements MetodoPagoService {

    private final MetodoPagoRepository repository;

    public MetodoPagoServiceImpl(MetodoPagoRepository repository) {
        this.repository = repository;
    }

    public List<MetodoPago> listar() {
        return repository.listar();
    }

    public List<MetodoPago> listarActivos() {
        return repository.listarActivos();
    }

    public MetodoPago obtenerPorId(int id) {
        return repository.obtenerPorId(id);
    }

    public void registrar(MetodoPago metodoPago) {
        repository.registrar(metodoPago);
    }

    public void actualizar(MetodoPago metodoPago) {
        repository.actualizar(metodoPago);
    }

    public void deshabilitar(int id) {
        repository.deshabilitar(id);
    }

    public void habilitar(int id) {
        repository.habilitar(id);
    }

    public boolean eliminar(int id) {
        return repository.eliminar(id);
    }
}

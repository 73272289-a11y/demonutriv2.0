package com.example.demo.Categoria;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CategoriaServiceImpl implements CategoriaService {

    private final CategoriaRepository repository;

    public CategoriaServiceImpl(CategoriaRepository repository) {
        this.repository = repository;
    }

    public List<Categoria> listar() {
        return repository.listar();
    }

    public List<Categoria> listarActivas() {
        return repository.listarActivas();
    }

    public Categoria obtenerPorId(int id) {
        return repository.obtenerPorId(id);
    }

    public void registrar(Categoria categoria) {
        repository.registrar(categoria);
    }

    public void actualizar(Categoria categoria) {
        repository.actualizar(categoria);
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

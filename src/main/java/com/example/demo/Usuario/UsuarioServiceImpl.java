package com.example.demo.Usuario;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class UsuarioServiceImpl implements UsuarioService {

    private final UsuarioRepository repository;

    public UsuarioServiceImpl(UsuarioRepository repository) {
        this.repository = repository;
    }

    public Usuario autenticar(String username, String clave) {
        return repository.buscarPorUsernameYClave(username, clave);
    }

    public List<Usuario> listar() {
        return repository.listar();
    }

    public List<Usuario> listarMotorizadosActivos() {
        return repository.listarMotorizadosActivos();
    }

    public Usuario obtenerPorId(int id) {
        return repository.obtenerPorId(id);
    }

    public void registrarMotorizado(Usuario usuario) {
        repository.registrarMotorizado(usuario);
    }

    public void actualizarMotorizado(Usuario usuario) {
        repository.actualizarMotorizado(usuario);
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

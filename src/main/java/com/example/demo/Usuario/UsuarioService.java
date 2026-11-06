package com.example.demo.Usuario;

import java.util.List;

public interface UsuarioService {
    Usuario autenticar(String username, String clave);
    List<Usuario> listar();
    List<Usuario> listarMotorizadosActivos();
    public Usuario obtenerPorId(int id);
    public void registrarMotorizado(Usuario usuario);
    void actualizarMotorizado(Usuario usuario);
    void deshabilitar(int id);
    void habilitar(int id);
    boolean eliminar(int id);
}

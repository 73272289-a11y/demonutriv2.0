package com.example.demo.Usuario;

import java.util.List;

public interface UsuarioRepository {
    Usuario buscarPorUsernameYClave(String username, String clave);
    List<Usuario> listar();
    List<Usuario> listarMotorizadosActivos();
    public Usuario obtenerPorId(int id);
    public void registrarMotorizado(Usuario usuario);
    void actualizarMotorizado(Usuario usuario);
    void deshabilitar(int id);
    void habilitar(int id);
    boolean eliminar(int id);
}

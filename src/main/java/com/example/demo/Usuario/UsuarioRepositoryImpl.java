package com.example.demo.Usuario;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioRepositoryImpl implements UsuarioRepository {

    private final JdbcTemplate jdbc;
    private final RowMapper<Usuario> mapper = (rs, rowNum) -> {
        Usuario u = new Usuario();
        u.setId(rs.getInt("id"));
        u.setNombre(rs.getString("nombre"));
        u.setApellido(rs.getString("apellido"));
        u.setUsername(rs.getString("username"));
        u.setClave(rs.getString("clave"));
        u.setRol(rs.getString("rol"));
        u.setActivo(rs.getBoolean("activo"));
        return u;
    };

    public UsuarioRepositoryImpl(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public Usuario buscarPorUsernameYClave(String username, String clave) {
        List<Usuario> lista = jdbc.query(
                "SELECT * FROM usuario WHERE username = ? AND clave = ? AND activo = TRUE", mapper, username, clave);
        return lista.isEmpty() ? null : lista.get(0);
    }

    public List<Usuario> listar() {
        return jdbc.query("SELECT * FROM usuario", mapper);
    }

    public List<Usuario> listarMotorizadosActivos() {
        return jdbc.query("SELECT * FROM usuario WHERE rol = 'MOTORIZADO' AND activo = TRUE", mapper);
    }

    public Usuario obtenerPorId(int id) {
        return jdbc.queryForObject("SELECT * FROM usuario WHERE id = ?", mapper, id);
    }

    public void registrarMotorizado(Usuario u) {
        jdbc.update("INSERT INTO usuario (nombre, apellido, username, clave, rol) VALUES (?, ?, ?, ?, 'MOTORIZADO')",
                u.getNombre(), u.getApellido(), u.getUsername(), u.getClave());
    }

    public void actualizarMotorizado(Usuario u) {
        jdbc.update("UPDATE usuario SET nombre = ?, apellido = ?, clave = ? WHERE id = ?",
                u.getNombre(), u.getApellido(), u.getClave(), u.getId());
    }

    public void deshabilitar(int id) {
        jdbc.update("UPDATE usuario SET activo = FALSE WHERE id = ?", id);
    }

    public void habilitar(int id) {
        jdbc.update("UPDATE usuario SET activo = TRUE WHERE id = ?", id);
    }

    public boolean eliminar(int id) {
        return jdbc.update("DELETE FROM usuario WHERE id = ? AND rol = 'MOTORIZADO' "
                + "AND NOT EXISTS (SELECT 1 FROM pedido WHERE id_motorizado = ?)", id, id) > 0;
    }
}

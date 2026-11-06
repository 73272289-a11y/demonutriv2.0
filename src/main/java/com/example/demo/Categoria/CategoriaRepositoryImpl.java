package com.example.demo.Categoria;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class CategoriaRepositoryImpl implements CategoriaRepository {

    private final JdbcTemplate jdbcTemplate;

    public CategoriaRepositoryImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Categoria> categoriaRowMapper = (rs, rowNum) -> {
        return new Categoria(
            rs.getInt("id"),
            rs.getString("nombre"),
            rs.getString("descripcion"),
            rs.getBoolean("activo")
        );
    };

    public List<Categoria> listar() {
        String query = "SELECT id, nombre, descripcion, activo FROM categoria";
        return jdbcTemplate.query(query, categoriaRowMapper);
    }

    public List<Categoria> listarActivas() {
        String query = "SELECT id, nombre, descripcion, activo FROM categoria WHERE activo = TRUE";
        return jdbcTemplate.query(query, categoriaRowMapper);
    }

    public Categoria obtenerPorId(int id) {
        String query = "SELECT id, nombre, descripcion, activo FROM categoria WHERE id = ?";
        List<Categoria> result = jdbcTemplate.query(query, categoriaRowMapper, id);
        if (result.isEmpty()) {
            return null;
        }
        return result.get(0);
    }

    public void registrar(Categoria categoria) {
        String query = "INSERT INTO categoria (nombre, descripcion) VALUES (?, ?)";
        jdbcTemplate.update(query, categoria.getNombre(), categoria.getDescripcion());
    }

    public void actualizar(Categoria categoria) {
        String query = "UPDATE categoria SET nombre = ?, descripcion = ? WHERE id = ?";
        jdbcTemplate.update(query, categoria.getNombre(), categoria.getDescripcion(), categoria.getId());
    }

    public void deshabilitar(int id) {
        String query = "UPDATE categoria SET activo = FALSE WHERE id = ?";
        jdbcTemplate.update(query, id);
    }

    public void habilitar(int id) {
        String query = "UPDATE categoria SET activo = TRUE WHERE id = ?";
        jdbcTemplate.update(query, id);
    }

    public boolean eliminar(int id) {
        String query = "DELETE FROM categoria WHERE id = ? "
                + "AND NOT EXISTS (SELECT 1 FROM producto WHERE id_categoria = ?)";
        return jdbcTemplate.update(query, id, id) > 0;
    }
}

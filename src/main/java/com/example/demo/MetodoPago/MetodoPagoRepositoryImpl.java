package com.example.demo.MetodoPago;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MetodoPagoRepositoryImpl implements MetodoPagoRepository {

    private final JdbcTemplate jdbcTemplate;

    public MetodoPagoRepositoryImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<MetodoPago> metodoPagoRowMapper = (rs, rowNum) -> {
        return new MetodoPago(
            rs.getInt("id"),
            rs.getString("nombre"),
            rs.getString("numero"),
            rs.getBoolean("activo")
        );
    };

    public List<MetodoPago> listar() {
        String query = "SELECT id, nombre, numero, activo FROM metodo_pago";
        return jdbcTemplate.query(query, metodoPagoRowMapper);
    }

    public List<MetodoPago> listarActivos() {
        String query = "SELECT id, nombre, numero, activo FROM metodo_pago WHERE activo = TRUE";
        return jdbcTemplate.query(query, metodoPagoRowMapper);
    }

    public MetodoPago obtenerPorId(int id) {
        String query = "SELECT id, nombre, numero, activo FROM metodo_pago WHERE id = ?";
        List<MetodoPago> result = jdbcTemplate.query(query, metodoPagoRowMapper, id);
        if (result.isEmpty()) {
            return null;
        }
        return result.get(0);
    }

    public void registrar(MetodoPago metodoPago) {
        String query = "INSERT INTO metodo_pago (nombre, numero) VALUES (?, ?)";
        jdbcTemplate.update(query, metodoPago.getNombre(), metodoPago.getNumero());
    }

    public void actualizar(MetodoPago metodoPago) {
        String query = "UPDATE metodo_pago SET nombre = ?, numero = ? WHERE id = ?";
        jdbcTemplate.update(query, metodoPago.getNombre(), metodoPago.getNumero(), metodoPago.getId());
    }

    public void deshabilitar(int id) {
        String query = "UPDATE metodo_pago SET activo = FALSE WHERE id = ?";
        jdbcTemplate.update(query, id);
    }

    public void habilitar(int id) {
        String query = "UPDATE metodo_pago SET activo = TRUE WHERE id = ?";
        jdbcTemplate.update(query, id);
    }

    public boolean eliminar(int id) {
        String query = "DELETE FROM metodo_pago WHERE id = ? "
                + "AND NOT EXISTS (SELECT 1 FROM pedido WHERE id_metodo_pago = ?)";
        return jdbcTemplate.update(query, id, id) > 0;
    }
}

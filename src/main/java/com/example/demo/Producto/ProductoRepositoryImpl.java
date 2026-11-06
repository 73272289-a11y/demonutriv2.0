package com.example.demo.Producto;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ProductoRepositoryImpl implements ProductoRepository {

    private final JdbcTemplate jdbc;
    private final RowMapper<Producto> mapper = (rs, rowNum) -> {
        Producto p = new Producto();
        p.setId(rs.getInt("id"));
        p.setNombre(rs.getString("nombre"));
        p.setDescripcion(rs.getString("descripcion"));
        p.setPrecio(rs.getBigDecimal("precio"));
        p.setDisponible(rs.getBoolean("disponible"));
        p.setIdCategoria(rs.getInt("id_categoria"));
        p.setCategoriaNombre(rs.getString("categoria_nombre"));
        return p;
    };

    private final String select = "SELECT p.*, c.nombre AS categoria_nombre "
            + "FROM producto p JOIN categoria c ON p.id_categoria = c.id ";

    public ProductoRepositoryImpl(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public List<Producto> listar() {
        return jdbc.query(select, mapper);
    }

    public List<Producto> listarDisponibles() {
        return jdbc.query(select + "WHERE p.disponible = TRUE AND c.activo = TRUE", mapper);
    }

    public Producto obtenerPorId(int id) {
        return jdbc.queryForObject(select + "WHERE p.id = ?", mapper, id);
    }

    public void registrar(Producto p) {
        jdbc.update("INSERT INTO producto (nombre, descripcion, precio, id_categoria) VALUES (?, ?, ?, ?)",
                p.getNombre(), p.getDescripcion(), p.getPrecio(), p.getIdCategoria());
    }

    public void actualizar(Producto p) {
        jdbc.update("UPDATE producto SET nombre = ?, descripcion = ?, precio = ?, id_categoria = ? WHERE id = ?",
                p.getNombre(), p.getDescripcion(), p.getPrecio(), p.getIdCategoria(), p.getId());
    }

    public void cambiarDisponibilidad(int id) {
        jdbc.update("UPDATE producto SET disponible = NOT disponible WHERE id = ?", id);
    }

    public boolean eliminar(int id) {
        return jdbc.update("DELETE FROM producto WHERE id = ? "
                + "AND NOT EXISTS (SELECT 1 FROM detalle_pedido WHERE id_producto = ?)", id, id) > 0;
    }
}

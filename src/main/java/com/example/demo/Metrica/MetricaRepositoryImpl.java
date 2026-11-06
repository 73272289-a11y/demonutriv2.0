package com.example.demo.Metrica;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MetricaRepositoryImpl implements MetricaRepository {

    private final JdbcTemplate jdbcTemplate;

    public MetricaRepositoryImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<MetricaDia> metricaDiaRowMapper = (rs, rowNum) -> {
        return new MetricaDia(
            rs.getDate("dia").toLocalDate(),
            rs.getInt("pedidos"),
            rs.getInt("entregados"),
            rs.getBigDecimal("ventas"),
            rs.getInt("platos")
        );
    };

    private final RowMapper<MetricaCategoria> metricaCategoriaRowMapper = (rs, rowNum) -> {
        return new MetricaCategoria(
            rs.getDate("mes").toLocalDate(),
            rs.getInt("bowls"),
            rs.getInt("bebidas"),
            rs.getInt("acompanamientos")
        );
    };

    public List<MetricaDia> pedidosPorDia() {
        String query = "SELECT CAST(p.fecha AS DATE) AS dia, "
                + "COUNT(*) AS pedidos, "
                + "SUM(CASE WHEN p.estado = 'ENTREGADO' THEN 1 ELSE 0 END) AS entregados, "
                + "SUM(CASE WHEN p.estado = 'ENTREGADO' THEN p.total ELSE 0 END) AS ventas, "
                + "SUM(CASE WHEN p.estado = 'ENTREGADO' THEN u.platos ELSE 0 END) AS platos "
                + "FROM pedido p "
                + "LEFT JOIN (SELECT id_pedido, SUM(cantidad) AS platos FROM detalle_pedido GROUP BY id_pedido) u "
                + "ON u.id_pedido = p.id "
                + "GROUP BY CAST(p.fecha AS DATE) "
                + "ORDER BY dia";
        return jdbcTemplate.query(query, metricaDiaRowMapper);
    }

    public List<MetricaCategoria> categoriasPorMes() {
        String query = "SELECT CAST(DATE_TRUNC(MONTH, p.fecha) AS DATE) AS mes, "
                + "SUM(CASE WHEN pr.id_categoria = 1 THEN d.cantidad ELSE 0 END) AS bowls, "
                + "SUM(CASE WHEN pr.id_categoria = 2 THEN d.cantidad ELSE 0 END) AS bebidas, "
                + "SUM(CASE WHEN pr.id_categoria = 3 THEN d.cantidad ELSE 0 END) AS acompanamientos "
                + "FROM detalle_pedido d "
                + "JOIN pedido p ON d.id_pedido = p.id "
                + "JOIN producto pr ON d.id_producto = pr.id "
                + "WHERE p.estado = 'ENTREGADO' "
                + "GROUP BY CAST(DATE_TRUNC(MONTH, p.fecha) AS DATE) "
                + "ORDER BY mes";
        return jdbcTemplate.query(query, metricaCategoriaRowMapper);
    }
}

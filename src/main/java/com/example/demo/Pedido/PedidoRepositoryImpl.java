package com.example.demo.Pedido;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class PedidoRepositoryImpl implements PedidoRepository {

    private final JdbcTemplate jdbc;
    private final RowMapper<Pedido> mapper = (rs, rowNum) -> {
        Pedido p = new Pedido();
        p.setId(rs.getInt("id"));
        p.setClienteNombre(rs.getString("cliente_nombre"));
        p.setClienteTelefono(rs.getString("cliente_telefono"));
        p.setClienteDireccion(rs.getString("cliente_direccion"));
        p.setFecha(rs.getString("fecha"));
        p.setTotal(rs.getBigDecimal("total"));
        p.setComprobante(rs.getString("comprobante"));
        p.setIdMetodoPago(rs.getInt("id_metodo_pago"));
        p.setMetodoPagoNombre(rs.getString("metodo_pago_nombre"));
        p.setEstado(rs.getString("estado"));
        p.setIdMotorizado(rs.getObject("id_motorizado", Integer.class));
        p.setMotorizadoNombre(rs.getString("motorizado_nombre"));
        return p;
    };

    private final String select = "SELECT p.id, p.cliente_nombre, p.cliente_telefono, p.cliente_direccion, "
            + "FORMATDATETIME(p.fecha, 'dd/MM/yyyy HH:mm') AS fecha, p.total, p.comprobante, p.id_metodo_pago, m.nombre AS metodo_pago_nombre, p.estado, "
            + "p.id_motorizado, u.nombre || ' ' || u.apellido AS motorizado_nombre "
            + "FROM pedido p JOIN metodo_pago m ON p.id_metodo_pago = m.id "
            + "LEFT JOIN usuario u ON p.id_motorizado = u.id ";

    public PedidoRepositoryImpl(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public void registrar(Pedido p) {
        jdbc.update("INSERT INTO pedido (cliente_nombre, cliente_telefono, cliente_direccion, comprobante, id_metodo_pago) "
                + "VALUES (?, ?, ?, ?, ?)",
                p.getClienteNombre(), p.getClienteTelefono(), p.getClienteDireccion(), p.getComprobante(),
                p.getIdMetodoPago());
    }

    public int ultimoId() {
        return jdbc.queryForObject("SELECT MAX(id) FROM pedido", Integer.class);
    }

    public void registrarDetalle(int idPedido, int idProducto, int cantidad) {
        jdbc.update("INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) "
                + "VALUES (?, ?, ?, (SELECT precio FROM producto WHERE id = ?))",
                idPedido, idProducto, cantidad, idProducto);
    }

    public void calcularTotal(int idPedido) {
        jdbc.update("UPDATE pedido SET total = (SELECT SUM(cantidad * precio_unitario) "
                + "FROM detalle_pedido WHERE id_pedido = ?) WHERE id = ?", idPedido, idPedido);
    }

    public Pedido buscarPorCodigoYTelefono(int id, String telefono) {
        List<Pedido> lista = jdbc.query(select + "WHERE p.id = ? AND p.cliente_telefono = ?", mapper, id, telefono);
        return lista.isEmpty() ? null : lista.get(0);
    }

    public List<String> listarDetalle(int idPedido) {
        return jdbc.queryForList("SELECT CONCAT(d.cantidad, ' x ', pr.nombre) FROM detalle_pedido d "
                + "JOIN producto pr ON d.id_producto = pr.id WHERE d.id_pedido = ?", String.class, idPedido);
    }

    public List<Pedido> listar() {
        return jdbc.query(select + "ORDER BY p.id DESC", mapper);
    }

    public Pedido obtenerPorId(int id) {
        return jdbc.queryForObject(select + "WHERE p.id = ?", mapper, id);
    }

    public void asignar(int id, int idMotorizado) {
        jdbc.update("UPDATE pedido SET id_motorizado = ?, estado = 'ASIGNADO' WHERE id = ? AND estado = 'PENDIENTE'",
                idMotorizado, id);
    }

    public List<Pedido> listarDeMotorizado(int idMotorizado, String estado) {
        return jdbc.query(select + "WHERE p.id_motorizado = ? AND p.estado = ? ORDER BY p.id DESC",
                mapper, idMotorizado, estado);
    }

    public void entregar(int id) {
        jdbc.update("UPDATE pedido SET estado = 'ENTREGADO' WHERE id = ? AND estado = 'ASIGNADO'", id);
    }
}

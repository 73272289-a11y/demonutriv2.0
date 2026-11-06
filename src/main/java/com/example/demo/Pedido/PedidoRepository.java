package com.example.demo.Pedido;

import java.util.List;

public interface PedidoRepository {
    void registrar(Pedido pedido);
    int ultimoId();
    void registrarDetalle(int idPedido, int idProducto, int cantidad);
    void calcularTotal(int idPedido);
    Pedido buscarPorCodigoYTelefono(int id, String telefono);
    List<String> listarDetalle(int idPedido);
    List<Pedido> listar();
    Pedido obtenerPorId(int id);
    void asignar(int id, int idMotorizado);
    List<Pedido> listarDeMotorizado(int idMotorizado, String estado);
    void entregar(int id);
}

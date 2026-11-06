package com.example.demo.Pedido;

import java.util.List;

public interface PedidoService {

    int registrar(Pedido pedido, List<Integer> idProducto, List<Integer> cantidad);
    Pedido buscarSeguimiento(int codigo, String telefono);
    List<String> listarDetalle(int idPedido);

    List<Pedido> listar();
    Pedido obtenerPorId(int id);
    void asignar(int id, int idMotorizado);

    List<Pedido> listarAsignados(int idMotorizado);
    List<Pedido> listarEntregados(int idMotorizado);
    void entregar(int id);
}

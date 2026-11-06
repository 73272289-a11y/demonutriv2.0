package com.example.demo.Pedido;

import java.math.BigDecimal;

public class Pedido {

    private int id;
    private String clienteNombre;
    private String clienteTelefono;
    private String clienteDireccion;
    private String fecha;
    private BigDecimal total;
    private String comprobante;
    private int idMetodoPago;
    private String metodoPagoNombre;
    private String estado;
    private Integer idMotorizado;
    private String motorizadoNombre;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getClienteNombre() { return clienteNombre; }
    public void setClienteNombre(String clienteNombre) { this.clienteNombre = clienteNombre; }

    public String getClienteTelefono() { return clienteTelefono; }
    public void setClienteTelefono(String clienteTelefono) { this.clienteTelefono = clienteTelefono; }

    public String getClienteDireccion() { return clienteDireccion; }
    public void setClienteDireccion(String clienteDireccion) { this.clienteDireccion = clienteDireccion; }

    public String getFecha() { return fecha; }
    public void setFecha(String fecha) { this.fecha = fecha; }

    public BigDecimal getTotal() { return total; }
    public void setTotal(BigDecimal total) { this.total = total; }

    public String getComprobante() { return comprobante; }
    public void setComprobante(String comprobante) { this.comprobante = comprobante; }

    public int getIdMetodoPago() { return idMetodoPago; }
    public void setIdMetodoPago(int idMetodoPago) { this.idMetodoPago = idMetodoPago; }

    public String getMetodoPagoNombre() { return metodoPagoNombre; }
    public void setMetodoPagoNombre(String metodoPagoNombre) { this.metodoPagoNombre = metodoPagoNombre; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }

    public Integer getIdMotorizado() { return idMotorizado; }
    public void setIdMotorizado(Integer idMotorizado) { this.idMotorizado = idMotorizado; }

    public String getMotorizadoNombre() { return motorizadoNombre; }
    public void setMotorizadoNombre(String motorizadoNombre) { this.motorizadoNombre = motorizadoNombre; }
}

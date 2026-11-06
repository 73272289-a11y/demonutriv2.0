package com.example.demo.Producto;

import java.math.BigDecimal;

public class ProductoVendido {

    private String nombre;
    private int cantidad;
    private BigDecimal importe;

    public ProductoVendido() {
    }

    public ProductoVendido(String nombre, int cantidad, BigDecimal importe) {
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.importe = importe;
    }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }

    public BigDecimal getImporte() { return importe; }
    public void setImporte(BigDecimal importe) { this.importe = importe; }
}

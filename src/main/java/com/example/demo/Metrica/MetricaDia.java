package com.example.demo.Metrica;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class MetricaDia {

    private LocalDate fecha;
    private int pedidos;
    private int entregados;
    private BigDecimal ventas;
    private int platos;

    public MetricaDia() {
    }

    public MetricaDia(LocalDate fecha, int pedidos, int entregados, BigDecimal ventas, int platos) {
        this.fecha = fecha;
        this.pedidos = pedidos;
        this.entregados = entregados;
        this.ventas = ventas;
        this.platos = platos;
    }

    public String getFechaTexto() {
        return fecha.format(DateTimeFormatter.ofPattern("dd/MM"));
    }

    public LocalDate getFecha() { return fecha; }
    public void setFecha(LocalDate fecha) { this.fecha = fecha; }

    public int getPedidos() { return pedidos; }
    public void setPedidos(int pedidos) { this.pedidos = pedidos; }

    public int getEntregados() { return entregados; }
    public void setEntregados(int entregados) { this.entregados = entregados; }

    public BigDecimal getVentas() { return ventas; }
    public void setVentas(BigDecimal ventas) { this.ventas = ventas; }

    public int getPlatos() { return platos; }
    public void setPlatos(int platos) { this.platos = platos; }
}

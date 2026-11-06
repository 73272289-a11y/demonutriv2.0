package com.example.demo.Metrica;

import java.math.BigDecimal;

public class MetricaResumen {

    private BigDecimal ventas;
    private int pedidos;
    private int entregados;
    private BigDecimal ticketPromedio;

    public MetricaResumen() {
    }

    public MetricaResumen(BigDecimal ventas, int pedidos, int entregados, BigDecimal ticketPromedio) {
        this.ventas = ventas;
        this.pedidos = pedidos;
        this.entregados = entregados;
        this.ticketPromedio = ticketPromedio;
    }

    public BigDecimal getVentas() { return ventas; }
    public void setVentas(BigDecimal ventas) { this.ventas = ventas; }

    public int getPedidos() { return pedidos; }
    public void setPedidos(int pedidos) { this.pedidos = pedidos; }

    public int getEntregados() { return entregados; }
    public void setEntregados(int entregados) { this.entregados = entregados; }

    public BigDecimal getTicketPromedio() { return ticketPromedio; }
    public void setTicketPromedio(BigDecimal ticketPromedio) { this.ticketPromedio = ticketPromedio; }
}

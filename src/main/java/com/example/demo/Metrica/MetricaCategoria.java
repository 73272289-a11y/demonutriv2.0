package com.example.demo.Metrica;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class MetricaCategoria {

    private LocalDate mes;
    private int bowls;
    private int bebidas;
    private int acompanamientos;

    public MetricaCategoria() {
    }

    public MetricaCategoria(LocalDate mes, int bowls, int bebidas, int acompanamientos) {
        this.mes = mes;
        this.bowls = bowls;
        this.bebidas = bebidas;
        this.acompanamientos = acompanamientos;
    }

    public String getMesTexto() {
        return mes.format(DateTimeFormatter.ofPattern("yyyy-MM"));
    }

    public LocalDate getMes() { return mes; }
    public void setMes(LocalDate mes) { this.mes = mes; }

    public int getBowls() { return bowls; }
    public void setBowls(int bowls) { this.bowls = bowls; }

    public int getBebidas() { return bebidas; }
    public void setBebidas(int bebidas) { this.bebidas = bebidas; }

    public int getAcompanamientos() { return acompanamientos; }
    public void setAcompanamientos(int acompanamientos) { this.acompanamientos = acompanamientos; }
}

package com.example.demo.Metrica;

import java.util.List;

public interface MetricaRepository {

    List<MetricaDia> pedidosPorDia();

    List<MetricaCategoria> categoriasPorMes();
}

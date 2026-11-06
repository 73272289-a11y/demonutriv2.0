package com.example.demo.Metrica;

import java.util.List;

public interface MetricaService {

    List<MetricaDia> serieDiaria();

    List<MetricaCategoria> serieCategorias();

    MetricaResumen resumen(List<MetricaDia> serie);
}

package com.example.demo.Metrica;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class MetricaServiceImpl implements MetricaService {

    private final MetricaRepository metricaRepository;

    public MetricaServiceImpl(MetricaRepository metricaRepository) {
        this.metricaRepository = metricaRepository;
    }

    public List<MetricaDia> serieDiaria() {
        return metricaRepository.pedidosPorDia();
    }

    public List<MetricaCategoria> serieCategorias() {
        return metricaRepository.categoriasPorMes();
    }

    public MetricaResumen resumen(List<MetricaDia> serie) {
        BigDecimal ventas = BigDecimal.ZERO;
        int pedidos = 0;
        int entregados = 0;
        for (MetricaDia dia : serie) {
            ventas = ventas.add(dia.getVentas());
            pedidos += dia.getPedidos();
            entregados += dia.getEntregados();
        }

        BigDecimal ticketPromedio = BigDecimal.ZERO;
        if (entregados > 0) {
            ticketPromedio = ventas.divide(BigDecimal.valueOf(entregados), 2, RoundingMode.HALF_UP);
        }
        return new MetricaResumen(ventas, pedidos, entregados, ticketPromedio);
    }
}

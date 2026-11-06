package com.example.demo.Metrica;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MetricaController {

    private final MetricaService metricaService;

    public MetricaController(MetricaService metricaService) {
        this.metricaService = metricaService;
    }

    @GetMapping("/metricas")
    public String metricas(Model model) {
        List<MetricaDia> serie = metricaService.serieDiaria();

        model.addAttribute("resumen", metricaService.resumen(serie));
        model.addAttribute("serie", serie);
        model.addAttribute("categorias", metricaService.serieCategorias());
        return "metricas";
    }
}

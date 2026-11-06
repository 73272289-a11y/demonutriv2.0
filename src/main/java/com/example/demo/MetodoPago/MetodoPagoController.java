package com.example.demo.MetodoPago;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MetodoPagoController {

    private final MetodoPagoService service;

    public MetodoPagoController(MetodoPagoService service) {
        this.service = service;
    }

    @GetMapping("/metodopago/lista")
    public String lista(Model model) {
        model.addAttribute("metodos", service.listar());
        return "metodopago/lista";
    }

    @GetMapping("/metodopago/nuevo")
    public String nuevo() {
        return "metodopago/nuevo";
    }

    @PostMapping("/metodopago/guardar")
    public String guardar(@ModelAttribute MetodoPago metodoPago) {
        service.registrar(metodoPago);
        return "redirect:/metodopago/lista";
    }

    @GetMapping("/metodopago/editar")
    public String editar(@RequestParam int id, Model model) {
        model.addAttribute("metodoPago", service.obtenerPorId(id));
        return "metodopago/editar";
    }

    @PostMapping("/metodopago/actualizar")
    public String actualizar(@ModelAttribute MetodoPago metodoPago) {
        service.actualizar(metodoPago);
        return "redirect:/metodopago/lista";
    }

    @GetMapping("/metodopago/deshabilitar")
    public String deshabilitar(@RequestParam int id, Model model) {
        model.addAttribute("metodoPago", service.obtenerPorId(id));
        return "metodopago/deshabilitar";
    }

    @PostMapping("/metodopago/deshabilitar")
    public String confirmarDeshabilitar(@RequestParam int id) {
        service.deshabilitar(id);
        return "redirect:/metodopago/lista";
    }

    @GetMapping("/metodopago/habilitar")
    public String habilitar(@RequestParam int id, Model model) {
        model.addAttribute("metodoPago", service.obtenerPorId(id));
        return "metodopago/habilitar";
    }

    @PostMapping("/metodopago/habilitar")
    public String confirmarHabilitar(@RequestParam int id) {
        service.habilitar(id);
        return "redirect:/metodopago/lista";
    }

    @GetMapping("/metodopago/eliminar")
    public String eliminar(@RequestParam int id, Model model) {
        model.addAttribute("metodoPago", service.obtenerPorId(id));
        return "metodopago/eliminar";
    }

    @PostMapping("/metodopago/eliminar")
    public String confirmarEliminar(@RequestParam int id) {
        if (service.eliminar(id)) {
            return "redirect:/metodopago/lista";
        }
        return "redirect:/metodopago/lista?error=asociados";
    }
}

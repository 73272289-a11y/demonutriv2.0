package com.example.demo.Categoria;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CategoriaController {

    private final CategoriaService service;

    public CategoriaController(CategoriaService service) {
        this.service = service;
    }

    @GetMapping("/categoria/lista")
    public String lista(Model model) {
        model.addAttribute("categorias", service.listar());
        return "categoria/lista";
    }

    @GetMapping("/categoria/nuevo")
    public String nuevo() {
        return "categoria/nuevo";
    }

    @PostMapping("/categoria/guardar")
    public String guardar(@ModelAttribute Categoria categoria) {
        service.registrar(categoria);
        return "redirect:/categoria/lista";
    }

    @GetMapping("/categoria/editar")
    public String editar(@RequestParam int id, Model model) {
        model.addAttribute("categoria", service.obtenerPorId(id));
        return "categoria/editar";
    }

    @PostMapping("/categoria/actualizar")
    public String actualizar(@ModelAttribute Categoria categoria) {
        service.actualizar(categoria);
        return "redirect:/categoria/lista";
    }

    @GetMapping("/categoria/deshabilitar")
    public String deshabilitar(@RequestParam int id, Model model) {
        model.addAttribute("categoria", service.obtenerPorId(id));
        return "categoria/deshabilitar";
    }

    @PostMapping("/categoria/deshabilitar")
    public String confirmarDeshabilitar(@RequestParam int id) {
        service.deshabilitar(id);
        return "redirect:/categoria/lista";
    }

    @GetMapping("/categoria/habilitar")
    public String habilitar(@RequestParam int id, Model model) {
        model.addAttribute("categoria", service.obtenerPorId(id));
        return "categoria/habilitar";
    }

    @PostMapping("/categoria/habilitar")
    public String confirmarHabilitar(@RequestParam int id) {
        service.habilitar(id);
        return "redirect:/categoria/lista";
    }

    @GetMapping("/categoria/eliminar")
    public String eliminar(@RequestParam int id, Model model) {
        model.addAttribute("categoria", service.obtenerPorId(id));
        return "categoria/eliminar";
    }

    @PostMapping("/categoria/eliminar")
    public String confirmarEliminar(@RequestParam int id) {
        if (service.eliminar(id)) {
            return "redirect:/categoria/lista";
        }
        return "redirect:/categoria/lista?error=asociados";
    }
}

package com.example.demo.Producto;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Categoria.CategoriaService;

@Controller
public class ProductoController {

    private final ProductoService service;
    private final CategoriaService categoriaService;

    public ProductoController(ProductoService service, CategoriaService categoriaService) {
        this.service = service;
        this.categoriaService = categoriaService;
    }

    @GetMapping("/producto/lista")
    public String lista(Model model) {
        model.addAttribute("productos", service.listar());
        return "producto/lista";
    }

    @GetMapping("/producto/nuevo")
    public String nuevo(Model model) {
        model.addAttribute("categorias", categoriaService.listarActivas());
        return "producto/nuevo";
    }

    @PostMapping("/producto/guardar")
    public String guardar(@ModelAttribute Producto producto) {
        service.registrar(producto);
        return "redirect:/producto/lista";
    }

    @GetMapping("/producto/editar")
    public String editar(@RequestParam int id, Model model) {
        model.addAttribute("producto", service.obtenerPorId(id));
        model.addAttribute("categorias", categoriaService.listar());
        return "producto/editar";
    }

    @PostMapping("/producto/actualizar")
    public String actualizar(@ModelAttribute Producto producto) {
        service.actualizar(producto);
        return "redirect:/producto/lista";
    }

    @GetMapping("/producto/disponibilidad")
    public String disponibilidad(@RequestParam int id, Model model) {
        model.addAttribute("producto", service.obtenerPorId(id));
        return "producto/disponibilidad";
    }

    @PostMapping("/producto/disponibilidad")
    public String cambiarDisponibilidad(@RequestParam int id) {
        service.cambiarDisponibilidad(id);
        return "redirect:/producto/lista";
    }

    @GetMapping("/producto/eliminar")
    public String eliminar(@RequestParam int id, Model model) {
        model.addAttribute("producto", service.obtenerPorId(id));
        return "producto/eliminar";
    }

    @PostMapping("/producto/eliminar")
    public String confirmarEliminar(@RequestParam int id) {
        if (service.eliminar(id)) {
            return "redirect:/producto/lista";
        }
        return "redirect:/producto/lista?error=asociados";
    }
}

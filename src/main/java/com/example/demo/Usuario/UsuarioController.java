package com.example.demo.Usuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UsuarioController {

    private final UsuarioService service;

    public UsuarioController(UsuarioService service) {
        this.service = service;
    }

    @GetMapping("/usuario/lista")
    public String lista(Model model) {
        model.addAttribute("usuarios", service.listar());
        return "usuario/lista";
    }

    @GetMapping("/usuario/nuevo")
    public String nuevo() {
        return "usuario/nuevo";
    }

    @PostMapping("/usuario/guardar")
    public String guardar(@ModelAttribute Usuario usuario) {
        service.registrarMotorizado(usuario);
        return "redirect:/usuario/lista";
    }
    @GetMapping("/usuario/editar")
    public String editar(@RequestParam int id, Model model) {
        model.addAttribute("usuario", service.obtenerPorId(id));
        return "usuario/editar";
    }
    @PostMapping("/usuario/actualizar")
    public String actualizar(@ModelAttribute Usuario usuario) {
        service.actualizarMotorizado(usuario);
        return "redirect:/usuario/lista";
    }

    @GetMapping("/usuario/deshabilitar")
    public String deshabilitar(@RequestParam int id, Model model) {
        model.addAttribute("usuario", service.obtenerPorId(id));
        return "usuario/deshabilitar";
    }

    @PostMapping("/usuario/deshabilitar")
    public String confirmarDeshabilitar(@RequestParam int id) {
        service.deshabilitar(id);
        return "redirect:/usuario/lista";
    }

    @GetMapping("/usuario/habilitar")
    public String habilitar(@RequestParam int id, Model model) {
        model.addAttribute("usuario", service.obtenerPorId(id));
        return "usuario/habilitar";
    }

    @PostMapping("/usuario/habilitar")
    public String confirmarHabilitar(@RequestParam int id) {
        service.habilitar(id);
        return "redirect:/usuario/lista";
    }

    @GetMapping("/usuario/eliminar")
    public String eliminar(@RequestParam int id, Model model) {
        model.addAttribute("usuario", service.obtenerPorId(id));
        return "usuario/eliminar";
    }

    @PostMapping("/usuario/eliminar")
    public String confirmarEliminar(@RequestParam int id) {
        if (service.eliminar(id)) {
            return "redirect:/usuario/lista";
        }
        return "redirect:/usuario/lista?error=asociados";
    }
}

package com.example.demo.Pedido;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Usuario.UsuarioService;

@Controller
public class PedidoAdminController {

    private final PedidoService service;
    private final UsuarioService usuarioService;

    public PedidoAdminController(PedidoService service, UsuarioService usuarioService) {
        this.service = service;
        this.usuarioService = usuarioService;
    }

    @GetMapping("/pedido/lista")
    public String lista(Model model) {
        model.addAttribute("pedidos", service.listar());
        return "pedido/lista";
    }

    @GetMapping("/pedido/asignar")
    public String asignar(@RequestParam int id, Model model) {
        model.addAttribute("pedido", service.obtenerPorId(id));
        model.addAttribute("motorizados", usuarioService.listarMotorizadosActivos());
        return "pedido/asignar";
    }

    @PostMapping("/pedido/asignar")
    public String guardarAsignacion(@RequestParam int id, @RequestParam int idMotorizado) {
        service.asignar(id, idMotorizado);
        return "redirect:/pedido/lista";
    }
}

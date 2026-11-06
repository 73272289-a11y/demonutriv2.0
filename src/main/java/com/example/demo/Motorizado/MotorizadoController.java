package com.example.demo.Motorizado;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Pedido.PedidoService;


@Controller
public class MotorizadoController {

    private final PedidoService service;

    public MotorizadoController(PedidoService service) {
        this.service = service;
    }

    @GetMapping("/motorizado/pedidos")
    public String pedidos(@RequestParam int idMotorizado, Model model) {
        model.addAttribute("idMotorizado", idMotorizado);
        model.addAttribute("pedidos", service.listarAsignados(idMotorizado));
        return "motorizado/pedidos";
    }

    @GetMapping("/motorizado/entregar")
    public String entregar(@RequestParam int id, @RequestParam int idMotorizado, Model model) {
        model.addAttribute("idMotorizado", idMotorizado);
        model.addAttribute("pedido", service.obtenerPorId(id));
        return "motorizado/entregar";
    }

    @PostMapping("/motorizado/entregar")
    public String confirmarEntrega(@RequestParam int id, @RequestParam int idMotorizado) {
        service.entregar(id);
        return "redirect:/motorizado/pedidos?idMotorizado=" + idMotorizado;
    }

    @GetMapping("/motorizado/historial")
    public String historial(@RequestParam int idMotorizado, Model model) {
        model.addAttribute("idMotorizado", idMotorizado);
        model.addAttribute("pedidos", service.listarEntregados(idMotorizado));
        return "motorizado/historial";
    }
}

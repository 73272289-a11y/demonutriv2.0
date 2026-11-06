package com.example.demo.Pedido;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.MetodoPago.MetodoPagoService;
import com.example.demo.Producto.ProductoService;

@Controller
public class PedidoController {

    private final PedidoService service;
    private final ProductoService productoService;
    private final MetodoPagoService metodoPagoService;

    public PedidoController(PedidoService service, ProductoService productoService,
                            MetodoPagoService metodoPagoService) {
        this.service = service;
        this.productoService = productoService;
        this.metodoPagoService = metodoPagoService;
    }

    @GetMapping("/")
    public String inicio() {
        return "redirect:/catalogo";
    }

    @GetMapping("/catalogo")
    public String catalogo(Model model) {
        model.addAttribute("productos", productoService.listarDisponibles());
        return "catalogo";
    }

    @GetMapping("/pedido/nuevo")
    public String nuevo(Model model) {
        model.addAttribute("productos", productoService.listarDisponibles());
        model.addAttribute("metodos", metodoPagoService.listarActivos());
        return "pedido/nuevo";
    }

    @PostMapping("/pedido/registrar")
    public String registrar(@ModelAttribute Pedido pedido,
                            @RequestParam List<Integer> idProducto,
                            @RequestParam List<Integer> cantidad) {
        int codigo = service.registrar(pedido, idProducto, cantidad);
        if (codigo == 0) {
            return "redirect:/pedido/nuevo";
        }
        return "redirect:/pedido/seguimiento?codigo=" + codigo + "&telefono=" + pedido.getClienteTelefono();
    }

    @GetMapping("/pedido/seguimiento")
    public String seguimiento(@RequestParam(required = false) Integer codigo,
                              @RequestParam(required = false) String telefono,
                              Model model) {
        if (codigo != null && telefono != null) {
            Pedido pedido = service.buscarSeguimiento(codigo, telefono);
            if (pedido != null) {
                model.addAttribute("pedido", pedido);
                model.addAttribute("detalle", service.listarDetalle(codigo));
            }
        }
        return "pedido/seguimiento";
    }
}

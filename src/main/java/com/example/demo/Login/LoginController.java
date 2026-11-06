package com.example.demo.Login;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Usuario.Usuario;
import com.example.demo.Usuario.UsuarioService;

@Controller
public class LoginController {

    private final UsuarioService service;

    public LoginController(UsuarioService service) {
        this.service = service;
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String ingresar(@RequestParam String username, @RequestParam String clave, Model model) {
        Usuario usuario = service.autenticar(username, clave);
        if (usuario == null) {
            model.addAttribute("error", "Usuario o clave incorrectos.");
            return "login";
        }
        if (usuario.getRol().equals("MOTORIZADO")) {
            return "redirect:/motorizado/pedidos?idMotorizado=" + usuario.getId();
        }
        return "redirect:/pedido/lista";
    }
}

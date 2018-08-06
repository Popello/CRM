package pl.crm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping("/")
public class HomeController {

    @GetMapping("/home")
    public String index(Model model, Principal  principal) {
        model.addAttribute("username", principal.getName());
        return "index";
    }
}

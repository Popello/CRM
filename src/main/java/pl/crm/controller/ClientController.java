package pl.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.WebApplicationContext;
import pl.crm.entity.Client;
import pl.crm.repository.ClientRepository;

import javax.validation.Valid;

@Controller
@Scope(value = WebApplicationContext.SCOPE_SESSION,
        proxyMode = ScopedProxyMode.TARGET_CLASS)
@RequestMapping("/clients")
public class ClientController {

    private ClientRepository clientRepository;


    @Autowired
    public ClientController(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }




    @GetMapping("/list")
    public String getAllClientsGet(Model model) {
        model.addAttribute("clients", clientRepository.findAll());
        return "clients/list";
    }

    @GetMapping("/add")
    public String createClient(Model model) {
        model.addAttribute("client", new Client());
        return "clients/add";
    }

    @PostMapping("/add")
    public String addCreatedClient(@Valid @ModelAttribute Client client, BindingResult result , Model model) {
        if(result.hasErrors()) {
            return "clients/add";
        }else {
            clientRepository.save(client);
            model.addAttribute("clients", clientRepository.findAll());
            return "redirect:/clients/list";
        }
    }

    @GetMapping("edit/{id}")
    public String showFormForEditClient(@PathVariable Long id, Model model) {
        model.addAttribute("client", clientRepository.findOne(id));
        return "/clients/edit";
    }

    @PostMapping("/edit/{id}")
    public String editClient(@ModelAttribute Client client, @PathVariable Long id, Model model) {
        client.setId(id);
        clientRepository.save(client);
        model.addAttribute("client", clientRepository.findAll());
        return "redirect:/clients/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteClient(@PathVariable Long id , Model model) {
        clientRepository.delete(id);
        model.addAttribute("client", clientRepository.findAll());
        return "redirect:/clients/list";
    }

}

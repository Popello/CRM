package pl.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.WebApplicationContext;
import pl.crm.entity.User;
import pl.crm.repository.UserRepository;

import javax.validation.Valid;

@Controller
@Scope(value = WebApplicationContext.SCOPE_SESSION,
        proxyMode = ScopedProxyMode.TARGET_CLASS)
@RequestMapping("/users")

public class UserController {
    private UserRepository userRepository;


    @Autowired
    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/list")
    public String getAllUsersGet(Model model) {
        model.addAttribute("users", userRepository.findAll());
        return "users/list";
    }

    @GetMapping("/add")
    public String createUser(Model model) {
        model.addAttribute("user", new User());
        return "users/add";
    }

    @PostMapping("/add")
    public String addCreatedUser(@Valid @ModelAttribute User user, BindingResult result , Model model) {
        if(result.hasErrors()) {
            return "users/add";
        }else {
            userRepository.save(user);
            model.addAttribute("users", userRepository.findAll());
            return "users/list";
        }
    }

    @GetMapping("edit/{id}")
    public String showFormForEditUser(@PathVariable Long id, Model model) {
        model.addAttribute("user", userRepository.findOne(id));
        return "/users/edit";
    }

    @PostMapping("/edit/{id}")
    public String editUser(@ModelAttribute User user, @PathVariable Long id, Model model) {
        user.setId(id);
        userRepository.save(user);
        model.addAttribute("user", userRepository.findAll());
        return "redirect:/users/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id , Model model) {
        userRepository.delete(id);
        model.addAttribute("user", userRepository.findAll());
        return "redirect:/users/list";
    }
}
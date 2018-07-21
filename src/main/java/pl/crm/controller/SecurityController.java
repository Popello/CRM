package pl.crm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.crm.entity.User;
import pl.crm.repository.UserRepository;

import javax.servlet.http.HttpSession;
import java.time.format.DateTimeFormatter;

@Controller
public class SecurityController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, HttpSession session) {
        if (SecurityContextHolder.getContext().getAuthentication().isAuthenticated()
                && !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
            return "redirect:/";
        }
        model.addAttribute("user", new User());
        session.setAttribute("dateTimeFormatter", DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss"));
        return "login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@ModelAttribute User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return "redirect:/login";
    }
}

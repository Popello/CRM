package pl.crm.controller;

import net.bytebuddy.implementation.bind.MethodDelegationBinder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.WebApplicationContext;
import pl.crm.entity.Task;
import pl.crm.repository.ClientRepository;
import pl.crm.repository.TaskRepository;
import pl.crm.repository.UserRepository;

import javax.validation.Valid;
import java.security.Principal;
import java.time.LocalDateTime;

@Controller
@Scope(value = WebApplicationContext.SCOPE_SESSION,
        proxyMode = ScopedProxyMode.TARGET_CLASS)
@RequestMapping("/tasks")
public class TaskController {

    private ClientRepository clientRepository;
    private UserRepository userRepository;
    private TaskRepository taskRepository;

    @Autowired
    public TaskController(ClientRepository clientRepository, UserRepository userRepository, TaskRepository taskRepository) {
        this.clientRepository = clientRepository;
        this.taskRepository = taskRepository;
        this.userRepository = userRepository;
    }




    @GetMapping("/list")
    public String getAllTaskssGet(Model model, Principal principal) {
        model.addAttribute("tasks", taskRepository.findAll());
        model.addAttribute("username", principal.getName());
        return "tasks/list";
    }

    @GetMapping("/add")
    public String createTask(Model model) {
        model.addAttribute("task", new Task());
        model.addAttribute("users", userRepository.findAll());
        model.addAttribute("clients", clientRepository.findAll());
        return "tasks/add";
    }

    @PostMapping("/add")
    public String addCreatedTask(@Valid @ModelAttribute Task task, BindingResult result , Model model) {
        if(result.hasErrors()) {
            return "tasks/add";
        }else {
            task.setCreated(LocalDateTime.now().withSecond(0).withNano(0));
            task.setLastModified(LocalDateTime.now().withSecond(0).withNano(0));
            taskRepository.save(task);
            return "redirect:/tasks/list";
        }
    }

    @GetMapping("edit/{id}")
    public String showFormForEditTask(@PathVariable Long id, Model model) {
        model.addAttribute("task", taskRepository.findOne(id));
        model.addAttribute("users", userRepository.findAll());
        model.addAttribute("clients", clientRepository.findAll());
        return "/tasks/edit";
    }

    @PostMapping("/edit/{id}")
    public String editTask(@ModelAttribute Task task, @PathVariable Long id, Model model) {
        task.setLastModified(LocalDateTime.now().withSecond(0).withNano(0));
        taskRepository.save(task);
        return "redirect:/tasks/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteTask(@PathVariable Long id , Model model) {
        taskRepository.delete(id);
        return "redirect:/tasks/list";
    }

    @RequestMapping("/send/{id}")
    public String sendTask(@PathVariable Long id, Model model) {
        Task taskSend = taskRepository.findOne(id);
        taskSend.setSend(LocalDateTime.now().withSecond(0).withNano(0));
        taskRepository.save(taskSend);
        return "redirect:/tasks/list";
    }

    @GetMapping("/pay/{id}")
    public String payTask(@PathVariable Long id, Model model) {
        Task taskPaid = taskRepository.findOne(id);
        taskPaid.setPaid(LocalDateTime.now().withSecond(0).withNano(0));
        taskRepository.save(taskPaid);
        return "redirect:/tasks/list";
    }

}

package pl.crm.controller;

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
    public String getAllTaskssGet(Model model) {
        model.addAttribute("tasks", taskRepository.findAll());
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
            taskRepository.save(task);
            model.addAttribute("tasks", taskRepository.findAll());
            model.addAttribute("users", userRepository.findAll());
            model.addAttribute("clients", clientRepository.findAll());
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
        task.setId(id);
        taskRepository.save(task);
        model.addAttribute("tasks", taskRepository.findAll());
        return "redirect:/tasks/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteTask(@PathVariable Long id , Model model) {
        taskRepository.delete(id);
        model.addAttribute("task", taskRepository.findAll());
        return "redirect:/tasks/list";
    }
}

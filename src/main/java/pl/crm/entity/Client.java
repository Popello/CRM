package pl.crm.entity;

import org.hibernate.validator.constraints.Email;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Table(name = "clients")

public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    @NotNull
    private String company;

    @Column
    @NotNull
    private String name;

    @Column
    @Email
    private String email;

    @Column
    @NotNull
    private int telephone;

    @OneToMany(mappedBy = "client")
    private List<Task> tasks;

    @OneToMany(mappedBy = "client")
    private List<Order> orders;



    public Client(String company, String name, String email, int telephone, List<Task> tasks, List<Order> orders) {
        super();
        this.company = company;
        this.name = name;
        this.email = email;
        this.telephone = telephone;
        this.tasks = tasks;
        this.orders = orders;
    }

    public Client() {
        super();
    }


    public Long getId() {
        return id;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTelephone() {
        return telephone;
    }

    public void setTelephone(int telephone) {
        this.telephone = telephone;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}

package pl.crm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pl.crm.entity.*;

@Repository
@Transactional
public interface TaskRepository extends JpaRepository<Task, Long> {

}

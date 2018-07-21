package pl.crm.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pl.crm.repository.UserRepository;

@Service
public class DBUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
        pl.crm.entity.User user = userRepository.findByName(name);
        UserDetails userDetails = User.builder()
                .username(user.getName())
                .password(user.getPassword())
                .roles(/*String.valueOf(user.getCategory())*/)
                .build();
        return userDetails;
    }
}

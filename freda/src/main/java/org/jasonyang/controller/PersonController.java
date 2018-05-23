package org.jasonyang.controller;

import org.jasonyang.dao.PersonRepository;
import org.jasonyang.entity.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Person Controller
 * @author jason
 * @date 18/5/24.
 */
@RestController
public class PersonController {

    @Autowired
    private PersonRepository personRepository;

    @RequestMapping(value="/person", method = RequestMethod.GET)
    public String testJpa(){
        Person zs = new Person();
        zs.setFirstName("San");
        zs.setLastName("Zhang");
        Person person = personRepository.findByFirstName("Jason");
        person.setFirstName("Freda");
        personRepository.save(person);
        return person.toString();
    }
}

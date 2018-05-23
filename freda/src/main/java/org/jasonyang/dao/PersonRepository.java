package org.jasonyang.dao;

import org.jasonyang.entity.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author jason
 * @date 18/5/23.
 */
@Repository
public interface PersonRepository extends JpaRepository<Person, Integer> {
    /**
     * findByFirstName
     * @param firstName
     * @return
     */
    Person findByFirstName(String firstName);

}

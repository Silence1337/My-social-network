package com.example.testProject.repos;

import com.example.testProject.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Integer> {

    List<Message> findByTag(String tag);
    List<Message> findAllByOrderByIdAsc();
}
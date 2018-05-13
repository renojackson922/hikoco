package org.silkdog.maven.hikoco;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class testServiceImpl implements testService{
    @Autowired
    testDAO testDAO;

    public List findById() {
        return testDAO.findById();
    }
}

package com.example.empcrud.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.empcrud.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long>{

}

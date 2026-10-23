package com.example.empcrud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.empcrud.entity.Employee;
import com.example.empcrud.repository.EmployeeRepository;

@Service
public class EmployeeService {
	
	
	private EmployeeRepository emprepo;

	public EmployeeService(EmployeeRepository emprepo) {
		
		this.emprepo = emprepo;
	}

public Employee saveEmployee(Employee e) {
	return emprepo.save(e);
}

public List<Employee> getAllEmpl(){
	return emprepo.findAll();
} 

public Employee getEmpById(Long id) {
	return emprepo.findById(id).orElse(null);
}
 public Employee updateEmp(Employee e) {
	 return emprepo.save(e);
 }
public void deleteEmp(Long id) {
	 emprepo.deleteById(id);
}



}

package com.example.empcrud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.empcrud.entity.Employee;
import com.example.empcrud.service.EmployeeService;

@Controller
public class EmployeeController {

	
	private EmployeeService empService;

	public EmployeeController(EmployeeService empService) {
		this.empService = empService;
	}
	
	@GetMapping("/")
	public String listEmp(Model model) {
		model.addAttribute("employees",empService.getAllEmpl());
		return "employee-list";
	}
	
	@GetMapping("/add")
	public String showAddForm(Model model) {
		model.addAttribute("employee", new Employee());
		return "employee-form";	
	}
	
	@PostMapping("/save")
	public String saveEmployee( 
		@ModelAttribute("employee") Employee employee) {
		empService.saveEmployee(employee);
		return "redirect:/";
	}
	
    @GetMapping("/edit/{id}")
	public String showEditForm(@PathVariable Long id,Model model, RedirectAttributes ra) {
		
		Employee emp=empService.getEmpById(id);
		if(emp==null)
		{	
		ra.addFlashAttribute("message", "Employee Not found");
		return "redirect:/";
	    }
		model.addAttribute("employee", emp);
		return "employee-form";
	}
    @PostMapping("/update")
    public String upadteEmployee(@ModelAttribute("employee")Employee employee,RedirectAttributes ra) {
    	if(employee.getId() == null || !employeeServiceExists(employee.getId())) {
    		ra.addFlashAttribute("message","Invalid employee id");
    		return "redirect:/";
    	}
    	empService.updateEmp(employee);
    	return "redirect:/";	
    }
    @PostMapping("/delete")
    public String deleteEmployee(@RequestParam Long id,RedirectAttributes ra) {
    	if(!employeeServiceExists(id))
    	{
    		ra.addFlashAttribute("message","Employee Not Found");
    		return "redirect:/";
    	}
    	empService.deleteEmp(id);
    	
    	return "redirect:/";
    }
private boolean employeeServiceExists(Long id)
{
	return empService.getEmpById(id)!=null;
	
	}
	
}

package com.lukejlackey.safetravels.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.lukejlackey.safetravels.models.Expense;
import com.lukejlackey.safetravels.services.ExpenseService;

@Controller
public class HomeController {
	
	@Autowired
	private ExpenseService expenseService;
	
	@GetMapping("/")
	public String index(Model model){
		model.addAttribute("expense", new Expense());
		model.addAttribute("expenses", expenseService.allExpenses());
		return "index.jsp";
	}
	
	@PostMapping("/add")
	public String addNew(@Valid @ModelAttribute("expense")Expense expense, BindingResult result) {
		if(result.hasErrors()) return "index.jsp";
		else {
			System.out.println(expenseService.createExpense(expense));
		}
		return "redirect:/";
	}
	
}

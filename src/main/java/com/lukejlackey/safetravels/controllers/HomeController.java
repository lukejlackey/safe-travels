package com.lukejlackey.safetravels.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

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
	
	@PostMapping("/")
	public String addNew(@Valid @ModelAttribute("expense")Expense expense, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("expenses", expenseService.allExpenses());
			return "index.jsp";
		}
		else {
			System.out.println(expenseService.createExpense(expense));
		}
		return "redirect:/";
	}
	
	@GetMapping("/edit/{id}")
	public String showEdit(@PathVariable("id") Long id, Model model) {
		model.addAttribute("expense",expenseService.findExpenseById(id));
		return "edit.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String edit(@Valid @ModelAttribute("expense")Expense expense, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("expense",expense);
			return "edit.jsp";
		}
		expenseService.updateExpense(expense);
		return "redirect:/";
	}
	
}

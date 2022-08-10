package com.lukejlackey.safetravels.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lukejlackey.safetravels.models.Expense;
import com.lukejlackey.safetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {

	private final ExpenseRepository expenseRepo;
	
	public ExpenseService(ExpenseRepository expenseRepo) {
		this.expenseRepo = expenseRepo;
	}
	
	public List<Expense> allExpenses(){
		return expenseRepo.findAll();
	}
	
	public String createExpense(Expense expense) {
		expenseRepo.save(expense);
		return "Created new expense: id#" + expense.getId();
	}
	
}

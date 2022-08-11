package com.lukejlackey.safetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.lukejlackey.safetravels.models.Expense;
import com.lukejlackey.safetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {

	private final ExpenseRepository expenseRepo;
	
	public ExpenseService(ExpenseRepository expenseRepo) {
		this.expenseRepo = expenseRepo;
	}
	
	public List<Expense> allExpenses() {
		return expenseRepo.findAll();
	}
	
	public Expense findExpenseById(Long id) {
		Optional<Expense> optionalExpense = expenseRepo.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		}
		return null;
	}
	
	public String createExpense(Expense expense) {
		expenseRepo.save(expense);
		return "Created new expense: id#" + expense.getId();
	}
	
	public Expense updateExpense(Expense expense) {
		expenseRepo.save(expense);
		System.out.println("Updated expense: id#" + expense.getId());
		return expense;
	}
	
	public void deleteExpense(Long id) {
		expenseRepo.deleteById(id);
	}
}

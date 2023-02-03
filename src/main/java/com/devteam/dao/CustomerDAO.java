package com.devteam.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.devteam.common.HashGenerator;
import com.devteam.entity.Customer;

public class CustomerDAO extends JpaDAO<Customer> implements GenericDAO<Customer> {

	@Override
	public Customer create(Customer t) {
		t.setRegisterDate(new Date());
		return super.create(t);
	}

	@Override
	public Customer get(Object id) {
		return super.find(Customer.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Customer.class, id);
		
	}

	@Override
	public List<Customer> listAll() {
		return super.findWithNamedQuery("Customer.findAll");
	}

	@Override
	public long count() {
		
		return super.countWithNamedQuery("Customer.countAll");
	}

	public Customer findByEmail(String email) {
		List<Customer> result = super.findWithNamedQuery("Customer.findByEmail", "email", email);
		
		if (!result.isEmpty()) {
			return result.get(0);
		}
		
		return null;
	}
	
	public Customer checkLogin(String email, String password) {
		Map<String, Object> parameters = new HashMap<>();
		String encryptedPassword = HashGenerator.generateMD5(password);
		parameters.put("email", email);
		parameters.put("pass", encryptedPassword);
		
		List<Customer> result = super.findWithNamedQuery("Customer.checkLogin", parameters);
		
		if (!result.isEmpty()) {
			return result.get(0);
		}
		
		return null;
	}

}

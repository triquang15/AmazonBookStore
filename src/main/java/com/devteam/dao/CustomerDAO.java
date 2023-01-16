package com.devteam.dao;

import java.util.Date;
import java.util.List;

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

}

package com.jacaranda.repositorio;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import com.jacaranda.model.Cinema;
import com.jacaranda.util.BdUtil;

public class CineRepository {
	
	public static Cinema addCine (Cinema c){
		Cinema result = null;
		Session session = BdUtil.getSessionFactory().openSession();//a través de la calse BdUtil conecta con bbdd y abre sesión
		Transaction transaction = session.beginTransaction();
		if(c.getCinema() != null) {//si el objeto tiene primary key
			
			try {
				result = session.merge(c);//añade a la bbdd el objeto c entero
				transaction.commit(); 
			} catch (Exception e) {
				transaction.rollback();
			}
		}
		
		session.close();
		return result;
		}

	public static List <Cinema> getCineList() {
		List<Cinema> result = new ArrayList<Cinema>();
		Session session = BdUtil.getSessionFactory().openSession();	
		Transaction transaction = session.beginTransaction();
		
		result = (ArrayList<Cinema>) session.createSelectionQuery("From Cinema").getResultList();
		return result;
		}
	
	public static void deleteCine(String nameCinema) {
		Session session = BdUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		SelectionQuery<Cinema> cine = session.createSelectionQuery("From Cinema where cinema = :nameCinema", Cinema.class);
		cine.setParameter("nameCinema", nameCinema);
		Cinema c = cine.getSingleResultOrNull();
		session.remove(c);
		transaction.commit();
		
	}
	
	public static Cinema resqueCinema (String nameCinema) {
		Session session = BdUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		SelectionQuery<Cinema> query = session.createSelectionQuery("From Cinema where cinema = :nameCinema", Cinema.class);
		query.setParameter("nameCinema", nameCinema);
		Cinema qry = query.getSingleResultOrNull();
		return qry;
		
	}
	
}
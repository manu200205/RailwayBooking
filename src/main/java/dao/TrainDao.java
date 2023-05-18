package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import dto.Train;
import dto.TrainTicket;
import dto.User;

public class TrainDao {
	EntityManagerFactory e = Persistence.createEntityManagerFactory("dev");
	EntityManager m = e.createEntityManager();
	EntityTransaction t = m.getTransaction();

	public void save(Train train) {
		t.begin();
		m.persist(train);
		t.commit();
	}

	public List<Train> fetchAll() {
		return m.createQuery("select x from Train x").getResultList();
	}

	public void delete(int tnumber) {
		t.begin();
		m.remove(m.find(Train.class, tnumber));
		t.commit();
	}
	public Train fetch(int tnumber){
		return m.find(Train.class, tnumber);
	}

	public void update(Train train) {
		t.begin();
		m.merge(train);
		t.commit();
		
	}
	public void save(TrainTicket ticket) {
		t.begin();
		m.persist(ticket);
		t.commit();
	}
	public TrainTicket fetchTicket(int pnr)
	{
		return m.find(TrainTicket.class, pnr);
	}
	public void update(TrainTicket ticket) {
		t.begin();
		m.merge(ticket);
		t.commit();
	}
}

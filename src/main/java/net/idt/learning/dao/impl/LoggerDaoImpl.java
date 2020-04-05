package net.idt.learning.dao.impl;

import net.idt.learning.dao.LoggerDao;
import net.idt.learning.dto.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class LoggerDaoImpl implements LoggerDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Logger get(int id) {
        return sessionFactory.getCurrentSession().get(Logger.class, id);
    }

    @Override
    public List<Logger> list() {
        return sessionFactory.getCurrentSession().createQuery("From Logger", Logger.class).getResultList();
    }

    @Override
    public List<Logger> limitedList(int count) {
        return sessionFactory
                .getCurrentSession()
                .createQuery("FROM Logger ORDER BY views DESC", Logger.class)
                .setFirstResult(0)
                .setMaxResults(count)
                .getResultList();
    }

    @Override
    public List<Logger> getTopViewedLoggers(int id, int count) {
        return sessionFactory
                .getCurrentSession()
                .createQuery("FROM Logger WHERE id <> :id ORDER BY views DESC", Logger.class)
                .setParameter("id", id)
                .setFirstResult(0)
                .setMaxResults(count)
                .getResultList();
    }

    @Override
    public boolean add(Logger logger) {
        try {
            sessionFactory.getCurrentSession().persist(logger);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Logger logger) {
        try {
            sessionFactory.getCurrentSession().update(logger);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(Logger logger) {
        try {
            sessionFactory.getCurrentSession().delete(logger);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
}

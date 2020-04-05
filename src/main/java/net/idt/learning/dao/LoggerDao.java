package net.idt.learning.dao;

import net.idt.learning.dto.Logger;
import net.idt.learning.dto.Product;

import java.util.List;

public interface LoggerDao {
    Logger get(int id);
    List<Logger> list();
    List<Logger> limitedList(int count);
    List<Logger> getTopViewedLoggers(int id, int count);
    boolean add(Logger logger);
    boolean update(Logger logger);
    boolean delete(Logger logger);
}

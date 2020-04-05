package net.idt.learning.exception;

public class LoggerNotFoundException extends Exception {
    private String message;

    public LoggerNotFoundException() {
        this("Logger is not available!");
    }

    public LoggerNotFoundException(String message) {
        this.message = System.currentTimeMillis() + ": " + message;
    }

    public String getMessage() {
        return message;
    }
}

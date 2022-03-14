package com.example.conference.exceptions;

import com.example.conference.dao.DataBaseSelector;

public class DataBaseNotSupportedException extends Exception {

    public DataBaseNotSupportedException() {
        super("Chosen database type not supported yet");
    }

    public DataBaseNotSupportedException(String message) {
        super(message);
    }

    public DataBaseNotSupportedException(DataBaseSelector db) {
        super(db.toString() + " database not supported yet");
    }
}
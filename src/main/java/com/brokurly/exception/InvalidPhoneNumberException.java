package com.brokurly.exception;

public class InvalidPhoneNumberException extends RuntimeException {
    public InvalidPhoneNumberException() {
        super();
    }

    public InvalidPhoneNumberException(String message) {
        super(message);
    }
}

package error;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author huynp
 */
public class RegistrationError {

    private String duplicateUsername;
    private String confirmNotMatch;

    public String getDuplicateUsername() {
        return duplicateUsername;
    }

    public void setDuplicateUsername(String duplicateUsername) {
        this.duplicateUsername = duplicateUsername;
    }

    public String getConfirmNotMatch() {
        return confirmNotMatch;
    }

    public void setConfirmNotMatch(String confirmNotMatch) {
        this.confirmNotMatch = confirmNotMatch;
    }

    public RegistrationError() {
    }

    public RegistrationError(String duplicateUsername, String confirmNotMatch) {
        this.duplicateUsername = duplicateUsername;
        this.confirmNotMatch = confirmNotMatch;
    }

}

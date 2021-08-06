/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author huynp
 */
//User data tranfer object
public class UserDTO {

    String userName, password, fullName;
    int role;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public UserDTO() {
    }

    public UserDTO(String userName, String password, String fullName, int role) {
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.role = role;
    }
}

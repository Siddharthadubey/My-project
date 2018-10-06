package com.entities;

/**
 *
 * @author durgesh
 */
public class User {

    private int uid;
    private String name;
    private String about;
    private String email;
    private String password;
    private String profilePic;

    public User(String name, String about, String email, String password, String profilePic) {

        this.name = name;
        this.about = about;
        this.email = email;
        this.password = password;
        this.profilePic = profilePic;
    }

    public User() {

    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }
    
    

}

package dtos;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author huynp
 */
//Brand data tranfer object
public class BrandDTO {
    
    private String brandName;
    private int id;

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public BrandDTO() {
    }

    public BrandDTO(String brandName, int id) {
        this.brandName = brandName;
        this.id = id;
    }

}

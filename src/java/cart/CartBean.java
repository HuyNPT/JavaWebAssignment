/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import dtos.ProductDTO;
import java.util.HashMap;

/**
 *
 * @author huynp
 */
//this class is cart object
public class CartBean extends HashMap<Integer, CartProduct> {

    public CartBean() {
        super();
    }

    public boolean addItem(CartProduct item, int quantityInDb) {
        int key = item.getId();
        if (this.containsKey(key)) {
            int oldQuantity = this.get(key).getQuantity();
            if (oldQuantity + item.getQuantity() > quantityInDb) {
                return false;
            } else {
                this.get(key).setQuantity(oldQuantity + item.getQuantity());
            }
        } else {
            item.setQuantity(item.getQuantity());
            this.put(item.getId(), item);
        }
        return true;
    }

    public boolean removeItem(int key) {
        if (this.containsKey(key)) {
            this.remove(key);
            return true;
        } else {
            return false;
        }
    }

    public boolean UpdateQuantity(int key, int quantity) {
        if (this.containsKey(key)) {

            this.get(key).setQuantity(quantity);
            return true;
        } else {
            return false;
        }
    }
}

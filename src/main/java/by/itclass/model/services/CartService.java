package by.itclass.model.services;

import by.itclass.model.entities.OrderItem;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

import static by.itclass.constants.AppConst.ORDER_ITEMS_ATTR;

public class CartService {
    private static CartService service;

    private CartService(){}

    public static CartService getInstance(){
        return service == null ? new CartService() : service;
    }
    public List<OrderItem> processCart(HttpSession session, String cartAction, OrderItem item) {
        var orderItems = session.getAttribute(ORDER_ITEMS_ATTR);
        List<OrderItem> items = orderItems != null ? (List<OrderItem>) orderItems : new ArrayList<>();
        switch (cartAction) {
            case "add" -> items.add(item);
            case "remove" -> items.remove(item);
//            case "increase" -> items.forEach(it -> chengePurchase(it, item, true));
//            case "increase" -> items.forEach(it -> chengePurchase(it, item, false));
            case "change" -> items.forEach(it -> setPurchase(it, item));
        }
        return items;

    }
//    private void changePurchase(OrderItem sourceItem changedItem, boolean isPlus){
//        if (sorceItem.equals(chgedItem)){
//            var quantity = sourceItem.getQuantity();
//            sourceItem.setQuantity(isPlus ? quantity + 1 : quantity - 1);
//        }
//    }

    private void setPurchase(OrderItem sorceItem, OrderItem changedItem){
        if(sorceItem.equals(changedItem)){
           sorceItem.setQuantity(changedItem.getQuantity());
        }
    }
}

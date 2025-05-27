package com.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
    private Map<Integer, OrderItem> items; // menuId -> OrderItem

    public Cart() {
        this.items = new HashMap<>();
    }

    public void addItem(MenuItem menuItem, int quantity) {
        if (items.containsKey(menuItem.getMenuId())) {
            OrderItem existingItem = items.get(menuItem.getMenuId());
            existingItem.setQuantity(existingItem.getQuantity() + quantity);
        } else {
            OrderItem newItem = new OrderItem();
            newItem.setMenuId(menuItem.getMenuId());
            newItem.setQuantity(quantity);
            newItem.setPrice(menuItem.getPrice());
            newItem.setMenuItem(menuItem);
            items.put(menuItem.getMenuId(), newItem);
        }
    }

    public void removeItem(int menuId) {
        items.remove(menuId);
    }

    public void updateQuantity(int menuId, int quantity) {
        if (items.containsKey(menuId)) {
            if (quantity <= 0) {
                removeItem(menuId);
            } else {
                items.get(menuId).setQuantity(quantity);
            }
        }
    }

    public List<OrderItem> getItems() {
        return new ArrayList<>(items.values());
    }

    public double getTotal() {
        return items.values().stream()
                .mapToDouble(OrderItem::getSubtotal)
                .sum();
    }

    public void clear() {
        items.clear();
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }

    public int getItemCount() {
        return items.size();
    }
}

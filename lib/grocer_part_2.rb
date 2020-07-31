require_relative './part_1_solution.rb'
require 'pry'

#consolidate_cart(cart)
#find_item_by_name_in_collection(name, collection)

def apply_coupons(cart, coupons)
  coupons.each{|coupon|
  item_with_coupon = find_item_by_name_in_collection(coupon[:item],cart)
      if item_with_coupon[:count] >= coupon[:num] && !!item_with_coupon
        cart << { item: "#{item_with_coupon[:item]} W/COUPON",
                  price: coupon[:cost] / coupon[:num],
                  clearance: item_with_coupon[:clearance],
                  count: coupon[:num]}
        item_with_coupon[:count] -=coupon[:num]
      end
    }
      cart
end

def apply_clearance(cart)
  cart.map{|items|
  if items[:clearance] == true
    items[:price] =(items[:price]*0.8).round(2)
  end
  # binding.pry
}
cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  consolidate_cart = consolidate_cart(cart)
  apply_coupons = apply_coupons(consolidate_cart,coupons)
  shopping_cart = apply_clearance(apply_coupons)
  # binding.pry
  total = 0
  shopping_cart.each{|items|
  total += items[:price]*items[:count]
  }
  if total >= 100
    total *=0.9
  end
  total
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end

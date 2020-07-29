require_relative './part_1_solution.rb'
require"pry"

#what I had, didnt work
#def apply_coupons(cart, coupons)
 # if coupons.empty?
  #  return cart
  #end
  #cart_arr = []
  #cart.each do |cart_item|
    #coupons.each do |coupon|
      #if cart_item[:item] == coupon[:item]
        #final_count = cart_item[:count]-coupon[:num]
        #coupon_price = coupon[:cost].to_f/coupon[:num]
        #item_name = cart_item[:item] + " W/COUPON"
        #cart_item[:count]=final_count
        #cart_arr<<cart_item
        #cart_arr<<{:item => item_name, :price => coupon_price, :clearance => cart_item[:clearance],
      #:count => coupon[:num]}
      #end
    #end  
  #end
  #cart_arr
#end

def apply_coupons(cart, coupons)
  i = 0
  coupons.each do |coupon|
    item_with_coupon = find_item_by_name_in_collection(coupon[:item], cart)
    item_is_in_basket = !!item_with_coupon
    count_is_big_enough_to_apply = item_is_in_basket && item_with_coupon[:count] >= coupon[:num]
    if item_is_in_basket and count_is_big_enough_to_apply
      cart << { item: "#{item_with_coupon[:item]} W/COUPON", 
                price: coupon[:cost] / coupon[:num], 
                clearance: item_with_coupon[:clearance],
                count: coupon[:num]
              }
      item_with_coupon[:count] -= coupon[:num]
    end
    i += 1
  end
  cart
end

def apply_clearance(cart)
  cart.each do|cart_item| 
    if cart_item[:clearance]
      percentage = cart_item[:price] * (0.20)
      cart_item[:price] -= percentage
    end
  end
  cart
end

def checkout(cart, coupons)
  checkout_cart = consolidate_cart(cart)
  checkout_cart = apply_coupons(checkout_cart,coupons)
  checkout_cart = apply_clearance(checkout_cart)
  price_to_pay = 0
  checkout_cart.each do |item|
    price_to_pay += item[:price].to_f * item[:count]
  end
  total = price_to_pay
  if price_to_pay > 100
    percentage = price_to_pay * (0.10)
    total = price_to_pay - percentage
  end
  total
 

  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end

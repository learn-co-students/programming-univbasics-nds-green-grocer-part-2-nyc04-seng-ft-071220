require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  cart.each do |item_line|
    coupons.each do |coupon_line|
      item_name = item_line[:item]
      coupon_item_name = coupon_line[:item]
      if item_name == coupon_item_name && coupon_line[:num] <= item_line[:count]
        new_item_hash = {:item => item_name + " W/COUPON"}
        new_item_hash[:price] = (coupon_line[:cost] / coupon_line[:num]).to_f
        new_item_hash[:clearance] = item_line[:clearance]
        new_item_hash[:count] = coupon_line[:num]
        item_line[:count] -= coupon_line[:num]
        cart << new_item_hash
        # binding.pry
      end
    end
  end
  cart
  
  # binding.pry
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |item_line|
    clearance = item_line[:clearance]
    price = item_line[:price]
    if clearance == true
      # Discount:
      # (3 x 20)/100 = $0.60
      # Final Price:
      # 3 - 0.60 = $2.40
      discount = (price * 20) / 100
      final_price = price - discount
      item_line[:price] = final_price.round(2)
      cart
      # binding.pry
    end
  end
  cart
  # binding.pry
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers

  #  We should pass the newly consolidated cart to `apply_coupons` and then send it to
  # `apply_clearance`. With all the discounts applied, we should loop through the
  # "consolidated and discounts-applied" cart and multiply each item Hash's price
  # by its count and accumulate that to a grand total.

  # As one last wrinkle, our grocery store offers a deal for customers buying lots
  # of items. If, after the coupons and discounts are applied, the cart's total is
  # over $100, the customer gets an additional 10% off. Apply this discount when
  # appropriate.
  new_consolidated_cart = consolidate_cart(cart)

  new_consolidated_cart = apply_coupons(new_consolidated_cart, coupons)

  new_consolidated_cart = apply_clearance(new_consolidated_cart)

  # new_consolidated_cart.each do |item_line|
  #   price = item_line[:price]
  #   count = item_line[:count]
  #   grand_total += price * count
  # end
  grand_total = 0
  new_consolidated_cart.each do|item_line|
    price = item_line[:price]
    count = item_line[:count]
    item_total = price * count
    grand_total += item_total
    # binding.pry
  end
  if grand_total > 100
    discount = (grand_total * 10) / 100
    grand_total -= discount
  end
  grand_total
  # binding.pry

end

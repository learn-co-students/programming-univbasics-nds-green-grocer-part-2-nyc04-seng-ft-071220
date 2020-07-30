require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |item_hash|
    coupons.each do |coupon_item_hash| 
      if  item_hash[:item] == coupon_item_hash[:item] && item_hash[:count] >= coupon_item_hash[:num]
          item_hash[:count] -= coupon_item_hash[:num]
          coupon_cart = {}
          coupon_cart[:item] = "#{item_hash[:item]} W/COUPON"
          coupon_cart[:price] = coupon_item_hash[:cost] / coupon_item_hash[:num]
          coupon_cart[:clearance] = item_hash[:clearance]
          coupon_cart[:count] = coupon_item_hash[:num]
          cart.push(coupon_cart)
          # binding.pry
      end
    end
  end
  cart
end

# item_hash[:item] == coupon_item_hash[:item] && item_hash[:count] >= coupon_item_hash[:num]

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |item_hash|
    if item_hash[:clearance]
      discount = item_hash[:price] * 0.20
      item_hash[:price] -= discount
      # binding.pry
    end
  end
  cart
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
  consolidate_cart = consolidate_cart(cart)
  consolidate_cart = apply_coupons(consolidate_cart, coupons)
  consolidate_cart = apply_clearance(consolidate_cart)

  total = 0
  consolidate_cart.each do |item_hash|
    total += item_hash[:price] * item_hash[:count]
    # binding.pry
  end

  if total > 100
    discount = total * 0.10
    total -= discount
  end

  total


  # binding.pry
end

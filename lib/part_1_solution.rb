# def find_item_by_name_in_collection(name, collection)
#   index = 0

#   collection.each do |grocery_item|
#     return grocery_item if grocery_item[:item] === name 
#     index += 1
#   end

#   nil
# end


# def consolidate_cart(cart)
#   index = 0
#   new_cart = []
  
#   cart.each do |grocery_item|
#     current_item = find_item_by_name_in_collection(grocery_item[:item], new_cart)
#     if current_item
#       new_cart_index = 0
#       new_cart.each do |new_cart_item|
#         if new_cart_item[:item] === current_item[:item]
#           new_cart_item[:count] += 1
#         end
#         new_cart_index += 1
#       end
#     else
#       grocery_item[:count] = 1
#       new_cart << grocery_item
#     end
#     index += 1
#   end
#   new_cart
# end

def find_item_by_name_in_collection(name, collection)
  collection.each do |item_info|
    item_info.each{|key, value| return item_info if value == name}
  # binding.pry
  end
  nil
end

def consolidate_cart(cart)
  single = cart.uniq
  single.each do|info_hash| 
    info_hash[:count] = cart.count{|x| x == info_hash} 
    # binding.pry
  end
end


require "pry"

def consolidate_cart(cart)
  new_cart = {}
 cart.uniq.each do |unique_item|
   count = 0 
   cart.each do |item|
     if unique_item == item
       count +=1
     end
   end
   unique_item.each do |name, info|
     new_cart[name] = info
     new_cart[name][:count] = count
   end
  end
 new_cart
end

def apply_coupons(cart, coupons)
  cart.clone.each do |item, info|
    info.each do |aspect, detail|
      coupons.each do |coupon|
        counter = 0
        coupon.each do |key, value|
          if coupon[:num] == 0
            cart 
          end
          if item == coupon[:item]
            cart["#{item} W/COUPON"] = {:price => coupon[:cost], :clearance => true, :count => 1}
            cart[item][:count] = cart[item][:count] - coupon[:num]
          end
        end
      end
    end
  end
cart

end

def apply_clearance(cart)
  cart.each do |item, attributes|
    if cart[item][:clearance] == true 
      cart[item][:price] = (cart[item][:price]*(0.8)).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  
end

# Constants help us "name" special numbers

def find_item_by_name_in_collection(name, collection)
  i = 0 # 0 is the first index of any array

while i < collection.length
    if collection[i][:item] == name # calling on our array and using the idex operator ,
                                    # accesing an item in our collection
        return collection[i] # it will try to find the item in the collection, find the matching name
    end
  i += 1
end
nil # ensures nil gets returned if while loops complete without finding an item
end


def consolidate_cart(cart)
  # code here
  new_cart = [] # new_cart variable, [] can fill with items now
  i = 0
    while i < cart.length
      unique_item = find_item_by_name_in_collection(cart[i][:item],new_cart) # taking method from above, taking each item in the cart
      ## and see if its our new cart to see if it already exists
      if  unique_item
        unique_item[:count] +=1 # will increase by 1 if item is not nil and access the count of the item
      else # if the item is equal nil, youd have to create a new item
      unique_item ={
        :item => cart[i][:item], # construct item for new cart,
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1 #
      }
      #once new hash is built, add new hash to new cart
      new_cart << unique_item
      end
      i +=1
  end
new_cart
end

def apply_coupons(cart, coupons)
  counter = 0

  while counter < coupons.length
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    couponed_item_name = "#{coupons[counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)

    if cart_item && cart_item[:count] >= coupons[counter][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[counter][:num]
        cart_item[:count] -= coupons[counter][:num]
      else
        cart_item_with_coupon = {
          :item => couponed_item_name,
          :price => coupons[counter][:cost]/ coupons[counter][:num],
          :count => coupons[counter][:num],
          :clearance => cart_item[:clearance]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[counter][:num]
    end

    end
    counter +=1
  end
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

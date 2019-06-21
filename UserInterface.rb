require './Cart.rb'
require './Shop.rb'

class UserInterface
	attr_reader :shop, :cart
	
	def initialize
		@shop = Shop.new
		@cart = Cart.new
	end

	def main_menu
		action = true
		while action == true
			puts "\n 1. Add product to Main productList\n 2. Dispaly main productlist\n 3. Remove product from main list\n 4. Add product to wish list\n 5.Remove product from wish_list\n 6. Dispaly selected product\n 7. Make bill of purchased product\n 8. Exit"
            puts "\nEnter your choice:"
            x = gets.to_i
            case x

	            when 1
	            	@shop.add_product_to_main_list
	        	 when 2
	        	 	@shop.display_main_product_list
	        	 when 3
	        	 	@shop.remove_from_main_product_list
	        	 when 4
	        	 	@cart.add_product_to_wish_list(shop)
	        	 when 5
	        	 	@cart.remove_product_from_wish_list
	        	 when 6
	        	 	@cart.show_wish_list
	        	 when 7
	        	 	@cart.check_out
        		else
        			break
        	end
		end
	end
end

user = UserInterface.new
user.main_menu

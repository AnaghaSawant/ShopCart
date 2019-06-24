require_relative './Category.rb'
require_relative './Shop.rb'

class Cart
	
	def initialize
		@wish_list = []
	end

	def add_product_to_wish_list(shop_object)
		shop_object.all_categories
		more = true
		while more == true
			puts "\nselect category"
			j = gets.chomp.to_i
			if(j == 0 || j >= 6)
				puts "Invalid choice\n"
			else
				selected_category = shop_object.categories.at(j-1)
				if(selected_category.products.empty?)
					puts "This category is empty\n"
				else
					puts "\nproduct_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount_percent"+"\t"+"selling_price"+"\t"+"quantity"
					selected_category.products.each do |i|
						puts "#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount_percent}\t\t#{i.selling_price}\t\t#{i.quantity}"
					end
					puts "\nSelect product from category"
					i = gets.chomp.to_i
					selected_product = selected_category.products.at(i-1)	

					temp_product = selected_product.clone
					puts "product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount_percent"+"\t"+"selling_price"+"\t"+"quantity"
					puts "#{temp_product.prod_id}\t\t#{temp_product.prod_name}\t\t#{temp_product.cost_price}\t\t#{temp_product.tax}\t\t#{temp_product.discount_percent}\t\t#{temp_product.selling_price}\t\t#{temp_product.quantity}"
					
					puts "enter quantity you want"
					qty = gets.chomp.to_i
					temp_product.quantity = qty
					left_product = selected_product.quantity - temp_product.quantity   
			        selected_product.quantity = left_product
			        puts "Left item: #{selected_product.quantity}\n"
			    
			        puts "Do u want to continue : Type c or n"
			        c = gets.chomp

					@wish_list << temp_product
					if c!= "c"
			            more = false
			        end
			    end
		    end
	    end
    end

	def show_wish_list
		puts "product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount_percent"+"\t"+"selling_price"+"\t"+"quantity"
		@wish_list.each do |i|
			puts "#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount_percent}\t\t#{i.selling_price}\t\t#{i.quantity}"
		end
	end

	def remove_product_from_wish_list
		more = true
		while more == true
			puts "Select product to remove"
			item = gets.chomp.to_i
			remove_product = @wish_list.delete_at(itadd_product_to_wish_listem-1)
			puts "product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount_percent"+"\t"+"selling_price"+"\t"+"quantity"
			puts "#{remove_product.prod_id}\t\t#{remove_product.prod_name}\t\t#{remove_product.cost_price}\t\t#{remove_product.tax}\t\t#{remove_product.discount_percent}\t\t#{remove_product.selling_price}\t\t#{remove_product.quantity}"
			puts "Do you want to remove more productadd_product_to_wish_listadd_product_to_wish_listadd_product_to_wish_listadd_product_to_wish_lists : Type c or n"
			c = gets.chomp.to_i
			if c!= "c"
	            more = false
	        end
	    end
	end

	def check_out
		@total = 0
        puts "product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount_percent"+"\t"+"selling_price"+"\t"+"quantity"
        @wish_list.each do |i| 
        	puts "#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount_percent}\t\t#{i.selling_price}\t\t#{i.quantity}"
			@QintoP =  i.selling_price * i.quantity
            @total = @total + @QintoP
        end
        puts "-----------------------------------------------------------------------------------------------"
        puts "total : #{@total}"
	end
end

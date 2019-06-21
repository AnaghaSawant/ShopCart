require './Category.rb'
require './Product.rb'
require 'byebug'

class Shop
	attr_reader :categories

	def initialize
		@products = []
	end
	
	def add_product_to_main_list
		prod = Product.new
		prod.add_products_info
		prod.set_discount
		prod.calculate_selling_price
		@products << prod
		puts "product added successfully.."
		CSV.open("MainProductlist.csv", "a+") do |csv|
			@products.each do |i|
				csv << [i.prod_id, i.prod_name, i.cost_price, i.tax, i.discount_percent, i.selling_price, i.quantity]
		  	end
		end
	end

	def display_main_product_list
		read_csv = CSV.open("MainProductlist.csv","r")
		read_csv.each do |i|
			puts i.join(' ')
		end
	end

	def remove_from_main_product_list
		byebug
		puts "enter item which you want to remove :"
		p = gets.chomp.to_i
		selected_product = @products.delete_at(p-1)
		puts "product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount_percent"+"\t"+"selling_price"+"\t"+"quantity"
		puts "#{selected_product.prod_id}\t\t#{selected_product.prod_name}\t\t#{selected_product.cost_price}\t\t#{selected_product.tax}\t\t#{selected_product.discount_percent}\t\t#{selected_product.selling_price}\t\t#{selected_product.quantity}"
	end
end
require './Category.rb'
require './Product.rb'

class Shop
	attr_reader :categories

	def initialize
		@categories = []
	end
	
	def all_categories
		puts "Displaying all categories"
		@cloth = Category.new
		@cloth.cat_id = 1
		@cloth.cat_name = "clothing"
		puts "#{@cloth.cat_id} #{@cloth.cat_name}"
		@cloth.products = []
		@categories << @cloth

		@book = Category.new
		@book.cat_id = 2
		@book.cat_name = "book"
		puts "#{@book.cat_id} #{@book.cat_name}"
		@book.products = []
		@categories << @book

		@home = Category.new
		@home.cat_id = 3
		@home.cat_name = "home"
		puts "#{@home.cat_id} #{@home.cat_name}"
		@home.products = []
		@categories << @home

		@shoe = Category.new
		@shoe.cat_id = 4
		@shoe.cat_name = "shoe"
		puts "#{@shoe.cat_id} #{@shoe.cat_name}"
		@shoe.products = [] 
		@categories << @shoe

		@cosmetic = Category.new
		@cosmetic.cat_id = 5
		@cosmetic.cat_name = "cosmetic"
		puts "#{@cosmetic.cat_id} #{@cosmetic.cat_name}"
		@cosmetic.products = []
		@categories << @cosmetic
	end

	def add_product_to_main_list		
		all_categories
		puts "select category from below categories to add product"
		cat = gets.chomp.to_i
		if(cat == 0 || cat >=6)
			puts "Invalid choice"
		else
			@temp = @categories.at(cat-1)
			puts "category name :#{@temp.cat_name}"
			prod = Product.new
			prod.add_products_info
			prod.set_discount
			prod.calculate_selling_price
			@temp.products << prod
			CSV.open("MainProductlist.csv", "wb") do |csv|
				csv << ["product_id","product_name","cost_price","tax","discount_percent","selling_price","quantity"]
				@temp.products.each do |i|
					csv << [i.prod_id,i.prod_name,i.cost_price,i.tax,i.discount_percent,i.selling_price,i.quantity]
			  	end
			end
		end
	end

	def display_main_product_list

		puts "product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount"+"\t"+"selling_price"+"\t"+"quantity"
		@categories.at(0).products.each do |i|
			# puts @categories.at(0).cat_name
			puts "#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount_percent}\t\t#{i.selling_price}\t\t#{i.quantity}"
		end

		@categories.at(1).products.each do |i|
			puts "#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount_percent}\t\t#{i.selling_price}\t\t#{i.quantity}"
		end

		@categories.at(2).products.each do |i|
			puts "#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount_percent}\t\t#{i.selling_price}\t\t#{i.quantity}"
		end

		@categories.at(3).products.each do |i|
			puts "#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount_percent}\t\t#{i.selling_price}\t\t#{i.quantity}"
		end

		@categories.at(4).products.each do |i|
			puts "#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount_percent}\t\t#{i.selling_price}\t\t#{i.quantity}"
		end
	end

	def remove_from_main_product_list
		puts "enter category from which you want to remove product"
		c = gets.chomp.to_i 
		if(c == 0 || c >= 6)
			puts "Invalid choice"
		else
			selected_category = @categories.at(c-1)
			puts selected_category.cat_name
			if(selected_category.products.empty?)
				puts "This category is empty"
			else
				puts "product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount_percent"+"\t"+"selling_price"+"\t"+"quantity"
				selected_category.products.each do |i|
					puts "#{i.prod_id}\t\t#{i.prod_name}\t\t#{i.cost_price}\t\t#{i.tax}\t\t#{i.discount_percent}\t\t#{i.selling_price}\t\t#{i.quantity}"
				end

				puts "enter item which you want to remove from selected category"
				p = gets.chomp.to_i
				selected_product = selected_category.products.delete_at(p-1)

				puts "product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount_percent"+"\t"+"selling_price"+"\t"+"quantity"
				puts "#{selected_product.prod_id}\t\t#{selected_product.prod_name}\t\t#{selected_product.cost_price}\t\t#{selected_product.tax}\t\t#{selected_product.discount_percent}\t\t#{selected_product.selling_price}\t\t#{selected_product.quantity}"
			end
		end
	end
end
require 'rspec'


class OrangeTree

	attr_accessor :height_tree, :age, :number_oranges, :alive
	@@instance_collector = []

	def initialize (height)
		@height_tree = height
		@age = 0
		@number_oranges = 0
		@alive = true
		@@instance_collector << self
	end

	def self.all_offspring
		@@instance_collector
	end

	def one_year_passes
		if @age+1 == 50
			@alive = false
			@height_tree = 0
			@age = 50
			@number_oranges = 0
			puts "the tree is dead as it reaches 50 years of existence"
		#grow the tree if age inferior to 50 and add orange to the tree
		else
			@age += 1
			@height_tree += 1

			if @age == 5
				@number_oranges = 20
			elsif @age > 5
				@number_oranges = (20 + age)
			end	
		end
	end

	def pick_an_orange
		if @number_oranges > 0
			@number_oranges -= 1
		else
			puts "there is no more orange on the tree"
		end
	end
end


class OrangeTreeOrchard

	attr_accessor :all_orange_trees

	#Create an Orchard with all the instances of the class OrangeTree
	def initialize
		@all_orange_trees = OrangeTree.all_offspring
	end

	def age_all_trees_by_one_year
		@all_orange_trees.each do |tree|
			tree.one_year_passes
		end
	end

	def pick_and_count_all_fruits
		fruit_count = 0

		@all_orange_trees.each do |tree|
			fruit_count += tree.number_oranges
			(1..tree.number_oranges).each do |i|
				tree.pick_an_orange
			end
		end

		puts "The total number of fruits picked is #{fruit_count}"
		return fruit_count
	end

	def average_height_average_fruit_trees
		total_height = 0
		total_oranges = 0

		@all_orange_trees.each do |tree|
			total_height += tree.height_tree
			total_oranges += tree.number_oranges
		end

		height_mean = total_height.to_f/(@all_orange_trees.length)
		orange_mean = total_oranges.to_f/(@all_orange_trees.length)

		puts "The average height is #{height_mean} and the average number of oranges is #{orange_mean}"
	end
end




#Create 4 orange trees
orange1 = OrangeTree.new (30)
orange2 = OrangeTree.new (10)
orange3 = OrangeTree.new (15)
orange4 = OrangeTree.new (25)

orange1.one_year_passes
orange1.one_year_passes

#Create an orchard with thos 4 orange trees
new_orchard = OrangeTreeOrchard.new

(1..7).each do |i|
	new_orchard.age_all_trees_by_one_year
end

new_orchard.average_height_average_fruit_trees
new_orchard.pick_and_count_all_fruits
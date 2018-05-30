require 'rspec'

class Monkey

	attr_accessor :name, :species, :foods_eaten

	def initialize (name_monkey, monkey_specie)
		@name = name_monkey.capitalize
		@species = monkey_specie
		@foods_eaten = []
	end

	def eat (nice_food)
		vowels = ["a","e","i","o","u","y"]
		unless vowels.include? nice_food[0]
		@foods_eaten << nice_food
		end
	end

	def introduce
		introduction = "My name is #{@name}, I am from the #{species} specie and i have eaten"
		if !(@foods_eaten == [])
			(0..@foods_eaten.length).each do |i|
				introduction += " #{@foods_eaten[i]}"
			end
		end
		introduction
	end
end
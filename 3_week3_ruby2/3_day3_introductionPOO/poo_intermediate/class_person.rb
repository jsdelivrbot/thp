class Person

	attr_accessor :name, :age
	@@people = []

	def initialize(initial_name,initial_age)
		@name = initial_name
		@age = initial_age
		@@people.push(self)
	end

	def say_name
		puts "Hi my name is #{@name}"
	end

	def self.get_people
		return @@people
	end

	def of_age_to_vote
		if self.age > 20
			puts "#{name} is old enough to vote"
		else
			puts "#{name} is not old enough to vote"
		end
	end

	#Compare the age of two people
	def self.compare_ages(person1, person2)
		if person1.age == person2.age
			puts "#{person1.name} and #{person2.name} have the same age"
		elsif person1.age > person2.age
			puts "#{person1.name} is older than #{person2.name}"
		else person1.age < person2.age
			puts "#{person2.name} is older than #{person1.name}"
		end		
	end

end

andy = Person.new("Andy", 25)
james = Person.new("James", 21)

james.of_age_to_vote

Person.compare_ages(andy,james)
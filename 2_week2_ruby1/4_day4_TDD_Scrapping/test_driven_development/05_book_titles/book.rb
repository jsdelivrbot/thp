class Book

#Define Book attributes
	attr_accessor :title

#Define initialize method, giving a name to each new Book instance created
	def title= (val)
		
		#Split initial title, initiate final title and specify array of exceotions
		table_name = val.split(' ')

		final_title = ""
		exceptions = ["a","an","on","the","over", "and", "in", "of"] 
	
		#Fill final_title using exceptions

		table_name.each do |i|
			if exceptions.include?(i)
				final_title += i + " "
			else
				final_title += i.capitalize + " "
			end
		end

		final_title.chop!

		final_title = final_title[0].upcase + final_title[1..-1]


		#Assigner le titre au nouveau nom
		@title = final_title

	end

end

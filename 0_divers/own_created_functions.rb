#Contains useful functions to be used
require 'rubygems'
require 'json'
require 'pp'

#Takes a csv file and convert it into an array of hashes, having as keys the first line of the csv
def from_csv_to_array_of_hashes(file_name)
	#Initiate an empty array that will get the data from the csv file
	new_array = []
	#Initiate a header array that will get the keys for the hash
	headers = []
	#Open CSV file
	File.open(file_name, "r") do |file|	
		#Get the headers and create a basic hash
		headers = file.first[0..-2].split(",")
		#For each line of the file create a hash and put it into the new_array
	 	file.each {|line|
				#Split the actual line without taking into account the return
				actual_line = line[0..-2].split(",")
				actual_hash = {}
				#Fill the actual hash with the actual_line values - there is only one line
				(0..headers.length-1).each {|j|
					actual_hash[headers[j].to_sym] = actual_line[j]
				}
				new_array << actual_hash
				#puts new_array
	 	}
	end
	new_array
end


#Define a method to transform an array of hashed with same keys into a csv file
def get_array_of_hashes_to_csv (array_of_hashes,file_name)
		#Write it into a CSV file
		CSV.open(file_name, "wb") do |csv|
		 	csv.each << array_of_hashes.first.keys # adds the attributes name on the first line
	 		array_of_hashes.each do |hash|
		   		csv << hash.values
		 	end
		end
		puts "The data has been put in a csv file #{file_name}"
end

#Puts object in JSON file
def puts_object_in_json_file (object, file_name)

	File.open(file_name,"w") do |f|
	f.write(object.to_json)
	end
end

def parse_json_file(file_name)
	
	json = File.read(file_name)
	obj = JSON.parse(json)
	

	#optional
		#p obj.class
		#pp obj
	#return transformed jason file
	return obj
end
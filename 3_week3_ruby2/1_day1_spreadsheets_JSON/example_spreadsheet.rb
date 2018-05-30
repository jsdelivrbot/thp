require 'google_drive'
require 'Pry'
require 'json'

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

#Take an empty spreadsheet in googleSheets and 
def fill_spreadsheet_from_array_of_hashes(spreadsheet_title,array)
	#puts array
	# Authenticate a session with your Service Account
	session = GoogleDrive::Session.from_service_account_key("client_secret.json")
	# Get the spreadsheet by its title
	spreadsheet = session.spreadsheet_by_title(spreadsheet_title)
	# Get the first worksheet
	worksheet = spreadsheet.worksheets.first

	#Fill each row of the Google SpreadSheet with the values of the array of hashes
		number_of_colums = array[0].keys.count
		array_keys = array[0].keys
		number_of_rows = array.length
	#Line 1 - put the values of the keys in the first row
		(0..(number_of_colums-1)).each { |j|
			worksheet[1, j+1] = array[0].keys[j].to_s
		}

	#Others lines put the values inside the hash - note that in spreadsheets the first cell is [1,1]
	#Limit in the  number of updates with the API so we don't fill in all the spreadsheet
	(1..10).each { |k|
	#(1..(number_of_rows-1)).each { |k|
		(0..(number_of_colums-1)).each { |l|
		worksheet[k+1, l+1] = array[k][array_keys[l]]
		}
	}

	worksheet.save
	puts "Ton tableau a été updaté"
end

#Puts object in JSON file
def puts_object_in_json_file (object, file_name)

	File.open(file_name,"w") do |f|
	f.write(object.to_json)
	end
end

#Parse Json file
def parse_json_file(file_name)
	
	json = File.read(file_name)
	obj = JSON.parse(json)
	

	#optional
	p obj.class
	pp obj
	#return transformed jason file
	return obj
end

#TESTS - delete # in front of a test to run it
#fill_spreadsheet_from_array_of_hashes("Emails-Mairies",from_csv_to_array_of_hashes("OLDall_french_townhall_emails.csv"))
#test_sheet
#puts_object_in_json_file(from_csv_to_array_of_hashes("OLDall_french_townhall_emails.csv"),"json_mairie.json")
puts parse_json_file("json_mairie.json")






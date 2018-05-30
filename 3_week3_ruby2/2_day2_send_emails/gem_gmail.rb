require 'gmail'
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
def fill_spreadsheet_from_array_of_hashes(spreadsheet_title,array,number_emails)
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
	(1..number_emails).each { |k|
	#(1..(number_of_rows-1)).each { |k|
		(0..(number_of_colums-1)).each { |l|
		worksheet[k+1, l+1] = array[k][array_keys[l]]
		}
	}
	worksheet.save
	puts "Your spreadsheet has been updated"
end

#1 Connect to the gmail service
#2 Fill a google sreadsheets with a predefined number of townhall email addresses coming from a initial scrapping put in a CSV file
#3 Go through the filled spreadsheet and send an email for each line
def get_gmail (number_emails, spreadsheet_title, csv_file_name)

	#Fill spreadsheet with the first #number_emails emails from the css file compiling the emails of off townhall email
	fill_spreadsheet_from_array_of_hashes(spreadsheet_title,from_csv_to_array_of_hashes(csv_file_name),number_emails)

	#Log in google spreadsheets
	session = GoogleDrive::Session.from_service_account_key("client_secret.json")
	spreadsheet = session.spreadsheet_by_title(spreadsheet_title)
	worksheet = spreadsheet.worksheets.first
		
	#Connect to gmail
	Gmail.connect("asheraz1990@gmail.com", "XXX") do |gmail|
		#For each line in the spreadsheet, except the first one (ie from 2 to #number_emails+1), send an email by connecting to gmail thgouh 0xauth-2
		(1..number_emails).each { |k|
			townhall_name = worksheet[k+1, 2]
			townhall_email = worksheet[k+1, 3]
			#Call the function write an email with the townhall adress mail and a text based on the townhall name
			unless townhall_email == ""
				#Define the email text
				text_email = "Bonjour," + "\n" + "\n" + "Je m'appelle Ashe, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite." + "\n" + "\n" + "Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{townhall_name}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec #{townhall_name} !" + "\n" + "\n" + "Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
				#Write and send email
				email = gmail.compose do
			  		to townhall_email
			 		subject "Une formation révolutionnaire"
					body text_email
				end
				email.deliver!
			end
		}
	end
end


#Run the tests below to send 200 email, one for each first 200 lines in the CSV file regrouping all emails from townhalls
get_gmail(200,"mairie_emails","all_french_townhall_emails.csv")









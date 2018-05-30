#Set the required gems for scrapping / parsing
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'HTTParty'
require 'Pry'



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

#Define a method to get an email adress from page
def get_the_email_of_a_townhal_from_its_webpage (url_mairie)


	begin
		# Get html text from the url given
		page = HTTParty.get(url_mairie)
		parse_page = Nokogiri::HTML(page)

		email_address = []
		#Get and print the email address from the webpage (webpage must be from annuaire-des-mairies.com)
		css1 = 'p:contains("@")'
		email_address = parse_page.css(css1)

		#Different request depending on the type of webpage (see difference between #01 dept and #52)
		if email_address.text == ""
			css2 = 'td:contains("@")'
			email_address = parse_page.css(css2)
			if email_address.text == ""
				email_adress = ""
				#puts "none"
			end
		end

		email_address.text
	
	rescue => e
	  puts "Exception Class: #{ e.class.name }"
	  puts "Exception Message: #{ e.message }"
	  puts "Exception Backtrace: #{ e.backtrace }"
	end
end

#Define a method to get all townhall url from department page
def get_all_the_townhall_emails_from_department_url (url_department, department)

	begin
		
		# Get html text from the url given
		page = HTTParty.get(url_department)
		parse_page = Nokogiri::HTML(page)

		url_page_list = []
		#Get and print the townhall url from the department webpage (webpage must be from annuaire-des-mairies.com) - ex http://annuaire-des-mairies.com/val-d-oise.html
		xpath2 = '//a[@class="lientxt"]'
		url_page_list = parse_page.xpath(xpath2)

		#Modify the URL format
		url_page_list_final =[]
		url_page_list.each {|i| url_page_list_final << {:ville2 => i.text,:url2 => "http://annuaire-des-mairies.com/#{i["href"].gsub("./","")}",:email => ""}}

		#Go over all links and get the email adress and put them in a table of hashes
		table_email_adress=[]

		url_page_list_final.each {|j| 
			table_email_adress << {:department => department, :ville => j[:ville2], :email => get_the_email_of_a_townhal_from_its_webpage(j[:url2])}
		}

		table_email_adress

	rescue => e
	  puts "Exception Class: #{ e.class.name }"
	  puts "Exception Message: #{ e.message }"
	  puts "Exception Backtrace: #{ e.backtrace }"
	end
end

#Get all french townhall emails by getting all departments URL and calling get_all_the_townhall_emails_from_department_url
def get_all_the_french_townhall_emails

	#Define where to get the department url giving the list of towns
	url_scrapping_departments= "http://www.annuaire-des-mairies.com/"
	begin
	
	# Get html text from the url given
	page = HTTParty.get(url_scrapping_departments)
	parse_page = Nokogiri::HTML(page)


	url_page_departments_list = []
	url_page_departments_list_final = []
	#Get athe department names and url
	css2 = 'section.well.section-border a.lientxt[href]'
	url_page_departments_list = parse_page.css(css2)

	#Create an array of hash with the department name and the associated url
	url_page_departments_list.each {|i|
	url_page_departments_list_final << {:department => i.text, :url_department => "http://www.annuaire-des-mairies.com/#{i['href']}"}
	}

	#From all the url of departments, get all the townhall url, put it in an array of hashes and create a CSS file
	array_all_townhall_url = []
	url_page_departments_list_final.each do |j|
	array_all_townhall_url += get_all_the_townhall_emails_from_department_url(j[:url_department],j[:department])
	end

	get_array_of_hashes_to_csv(array_all_townhall_url,"all_french_townhall_emails.csv")
	  
	rescue => e
	  puts "Exception Class: #{ e.class.name }"
	  puts "Exception Message: #{ e.message }"
	  puts "Exception Backtrace: #{ e.backtrace }"
	  puts array_all_townhall_url
	end

end


#Test functions by getting all email-adresses from val-d'oise
get_all_the_french_townhall_emails



#get_all_the_urls_of_department_townhalls("http://annuaire-des-mairies.com/val-d-oise.html", "Val d'Oise")


#get_the_email_of_a_townhal_from_its_webpage ("http://www.annuaire-des-mairies.com/02/abbecourt.html")








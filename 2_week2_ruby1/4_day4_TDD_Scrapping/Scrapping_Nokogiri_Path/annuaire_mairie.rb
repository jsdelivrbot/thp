#Set the required gems for scrapping / parsing
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'HTTParty'
require 'Pry'



#Define a method to get an email adress from page
def get_the_email_of_a_townhal_from_its_webpage (url_mairie)

	begin
		
		# Get html text from the url given
		page = HTTParty.get(url_mairie)
		parse_page = Nokogiri::HTML(page)

		email_address = []
		#Get and print the email address from the webpage (webpage must be from annuaire-des-mairies.com)
		xpath1 = '//td[@class="style27"]/ p[@class="Style22"]/ font'

		email_address = parse_page.xpath(xpath1)
		
		#Print the #6 from the table, corresponding to the email adress
		email_address[5].text


	rescue => e
	  puts "Exception Class: #{ e.class.name }"
	  puts "Exception Message: #{ e.message }"
	  puts "Exception Backtrace: #{ e.backtrace }"
	end

end

#Define a method to get all townhall url from department page
def get_all_the_urls_of_department_townhalls (url_department)

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
		url_page_list.each {|i| url_page_list_final << {:ville => i.text,:url => "http://annuaire-des-mairies.com/#{i["href"].gsub("./","")}",:email => ""}}

		#Go over all links and get the email adress and put them in a table of hashes
		table_email_adress=[]

		#puts url_page_list_final

		url_page_list_final.each {|j| 
			table_email_adress << {:ville => j[:ville], :email => get_the_email_of_a_townhal_from_its_webpage(j[:url])}
		}

		#puts table_email_adress
		#Write it into a CSV file
		CSV.open("data_mairies_email.csv", "wb") do |csv|
		  csv << table_email_adress.first.keys # adds the attributes name on the first line
		  table_email_adress.each do |hash|
		    csv << hash.values
		  end
		end
		puts "The list of email addresses of the townhalls has been put in a csv file data_mairie_email.csv"

	rescue => e
	  puts "Exception Class: #{ e.class.name }"
	  puts "Exception Message: #{ e.message }"
	  puts "Exception Backtrace: #{ e.backtrace }"
	end

end


#Test functions by getting all email-adresses from val-d'oise
get_all_the_urls_of_department_townhalls ("http://annuaire-des-mairies.com/val-d-oise.html")
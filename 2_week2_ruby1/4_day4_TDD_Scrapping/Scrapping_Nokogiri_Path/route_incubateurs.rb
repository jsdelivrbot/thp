#Set the required gems for scrapping / parsing
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'HTTParty'
require 'Pry'


class IncubateursFrance
	attr_accessor :source, :incubators_list

	#Initialise attributes and launch scrapping method
	def initialize
		@source = "http://www.alloweb.org/annuaire-startups/annuaire-incubateurs/incubateurs-startups/"
		@incubators_list = []

		homepage_scrapping

		incubator_scrapping
	end

	#Launch scrapping on main page and return an array of links
	def homepage_scrapping
		url=""
		(1..29).each { |i|
			#There is 29 pages on their website, build the correct url for each page we want to visit
			if i == 1
				url = source
			else
				url = source + "page/#{i}/"
			end

			#For each page, scrapp the links to each incubator page
				# Get html text from the url given, selecting the links
				html_link_list=[]
				page = HTTParty.get(url)
				parse_page = Nokogiri::HTML(page)
				#Get only the links we need
				css_selector = 'div.entry-title h2 a'
				html_link_list = parse_page.css(css_selector)

				#Put the results in incubators_list
				html_link_list.each {|j|
					@incubators_list << {:name => j.text ,:url_on_website => j['href'], :address =>"", :website =>""}
				}
		}
	end

	#Launch scrapping on all incubator pages and returns array of hash with incubator name, postal code and link to their website
	def incubator_scrapping
		#For each incubator, go to their webpage on the website and scrap the address and their website url
			url=""
			i=0
			incubators_list.each { |hash_incubator|
				url = hash_incubator[:url_on_website]
				# Get html text from the url given, selecting the links
				page = HTTParty.get(url)
				parse_page = Nokogiri::HTML(page)
				
				#Get the address
				css_selector = '#frontend_address'
				html_link_list = parse_page.css(css_selector)
				@incubators_list[i][:address] = html_link_list.text

				#Get the url of their website
				css_selector = 'a#website/@href'
				html_link_list = parse_page.css(css_selector)

				@incubators_list[i][:website] = html_link_list[0].text
			#Increment i that help us fill out the data for each incubator
			i += 1
			}

		#Write it into a CSV file
		CSV.open("data_incubateurs.csv", "wb") do |csv|
		  csv << @incubators_list.first.keys # adds the attributes name on the first line
		  @incubators_list.each do |hash|
		    csv << hash.values
		  end
		puts "The incubator list has been put in a csv file data.csv"
		end
	end

end

my_incubator_list = IncubateursFrance.new

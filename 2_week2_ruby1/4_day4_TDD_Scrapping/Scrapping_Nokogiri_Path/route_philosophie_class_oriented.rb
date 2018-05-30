#Set the required gems for scrapping / parsing
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'HTTParty'
require 'Pry'


class WikiPhilosophyRoad
	attr_accessor :goal_link, :url_history

	def initialize
		@url_history= []
		@goal_link = "https://fr.wikipedia.org/wiki/Philosophie"

		wiki_road

	end


	#Method to create a clean list of the names of the pages visited
	def pages_visited_and_distance
		url_history_text = []
		@url_history.each { |k|
		url_history_text << k.gsub("https://fr.wikipedia.org/wiki/","")
		}
		#Return the search history through the names of the visited pages
		puts "You have visited the following pages #{url_history_text}"
		puts "The distance from initial page to the last page is #{@url_history.length-1}"
	end

	#Method to determine if we are in a loop
	def in_a_loop
			#Test if we are in a loop by counting occurences of page url in url_history array. Build the count hash
			counts = Hash.new(0)
			test_loop = false
			url_history.each {|i| counts[i] += 1}
			#Verify if there is an url with an occurence >1 and modify the "in_a_loop" value if needed
			twice_url ={}
			twice_url = counts.key(2)
			if !(twice_url == nil)
				test_loop = true
			end

			#Return a boolean to indicate if we are in a loop
			return test_loop
	end

	#Method calling the other methods to build the path to philisophy
	def wiki_road

		#Initiate the url to a random page and initiate the url_history array
		link = "https://fr.wikipedia.org/wiki/Sp%C3%A9cial:Page_au_hasard"
		url_history = []
		url_history << link
		page_has_no_link = false

		while !(link == goal_link) && !(in_a_loop) && !(page_has_no_link)
				# Get html text from the url given
				page = HTTParty.get(link)
				parse_page = Nokogiri::HTML(page)

				#Get all links from the current page
				a_html_link_list =[]
				link_list = []

				xpath1 = 'div#bodyContent p a'
				a_html_link_list = parse_page.css(xpath1)
				a_html_link_list.each {|link| link_list << link['href']}


				#Test if the page has no link
				if link_list.length == 0 || link_list == nil
					page_has_no_link = true
				
				#Else find an appropriate link to go to
				else
					#Do not redirect to links such as "Aide:" and others of this type
					k = 0
					while (link_list[k].include? ':') || (link_list[k].include? 'edit') || (link_list[k].include? '//fr') || (link_list[k].include? 'upload')
						k += 1
					end
					link = "https://fr.wikipedia.org" + link_list[k]
					#link = link_list[k]
				end

				@url_history << link	

		end			

		#Define what answer to return depending on if we succeded or not	
		if link == goal_link
			puts "It worked!! You landed on the Philisophy page!"
			pages_visited_and_distance
			
		elsif in_a_loop
			puts "The test failed, you are in an infinite loop"
			pages_visited_and_distance
		elsif page_has_no_link
			puts "The test failed, you are on a page with no link"
			pages_visited_and_distance
		else
			puts "This is the end, for no reason :p"
			pages_visited_and_distance
		end	


	end
end

wikiTest = WikiPhilosophyRoad.new
#Set the required gems for scrapping / parsing
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'HTTParty'
require 'Pry'


def philosophy_road (url)

	begin
	
	#Define 2 variables, one for the next page to go to and another one to define the url goal 
	link = url
	goal_link = "https://fr.wikipedia.org/wiki/Philosophie"
	
	#Define three variables that will identify end of program conditions, either if we are in a loop are if the current page has no links
	page_has_no_link = false
	
	in_a_loop = false
	url_history = []
	url_history << link

	#Define when to stop the search for the philosophy page and what to do in other cases
	while !(link == goal_link) && !in_a_loop && !page_has_no_link
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
			if link_list.length == 0
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
				
		

			#Test if we are in a loop by counting occurences of page url in url_history array
			#Build the count hash
			counts = Hash.new(0)
			url_history.each {|i| counts[i] += 1}
			
			#Verify if there is an url with an occurence >1 and modify the "in_a_loop" value if needed
			twice_url ={}
			twice_url = counts.key(2)
			if !(twice_url == nil)
				in_a_loop = true
			end
			
			url_history << link	

	end	

	#Refine url_history to display it
	url_history_text = ""
	url_history.each { |k|
		url_history_text << k.gsub("https://fr.wikipedia.org/wiki/","") + " / "
	}
		
	#Define what answer to return depending on if we succeded or not	
	if link == goal_link
		puts "It worked!! You landed on the Philisophy page!"
		puts "The distance to the philosophy page is #{url_history.length-1} clicks"
		puts "And you visited the following pages #{url_history_text}"
		
	elsif in_a_loop
		puts "The test failed, you are in an infinite loop"
		puts "And you visited the following pages #{url_history_text}"
	elsif page_has_no_link
		puts "The test failed, you are on a page with no link"
		puts "And you visited the following pages #{url_history_text}"
	else
		puts "This is the end, for no reason :p"
		puts "And you visited the following pages #{url_history_text}"
	end	



	rescue => e
	  puts "Exception Class: #{ e.class.name }"
	  puts "Exception Message: #{ e.message }"
	  puts "Exception Backtrace: #{ e.backtrace }"
	end

end


#philosophy_road("https://fr.wikipedia.org/wiki/Religion_gauloise")
#philosophy_road("https://fr.wikipedia.org/wiki/Dramaturge")
philosophy_road("https://fr.wikipedia.org/wiki/Sp%C3%A9cial:Page_au_hasard")







#!/usr/bin/env ruby
require 'twitter'



	#Définir les clients qui vont être utilisés
	
	client = Twitter::Streaming::Client.new do |config|
	  #put your  consumer and access keys here
	  
end



	client2 = Twitter::REST::Client.new do |config2|
	  #put your  consumer and access keys here

end
	
	counts = {:favorite => 0, :retweet => 0, :follow => 0, :reply => 0}
	#Filtrer tweets based on topics and Paris location
	
	topics = ["bourré", "greve", "grêve", "vtc", "soirée" "galère", "aéroport", "codepromo", "promotion", "crevé"]
	client.filter(:track => topics.join(","), :geocode => "2.334,48.859,10mi") do |object|
	  


	  #If the object is a tweet, then wait a random number of seconds and execute a random action
	 	if object.is_a?(Twitter::Tweet)

	 		rand_action = rand(7)
	 		status_identity = object.id.to_i
	 		tweet_text = object.text
	 		user_id = object.user.id

	 		#Limit actions in time, one each x seconds
	 		sleep (1+rand(240))
 		


		 		#Chose an action depending on the random nunmber generated
		 		if rand_action == 0 #|| rand_action == 1
		 			#puts object.text
		 			#puts object.user.name
		 			#puts status_identity
		 			#puts tweet_text
		 			client2.favorite(object)
		 			counts[:favorite] +=1
		 			#puts "Favorite"
	 			
	 			elsif rand_action == 2 || rand_action == 3 
		 			client2.retweet(object)
		 			counts[:retweet] +=1
		 			#puts "Retweet"

	 			elsif rand_action == 4 #|| rand_action == 5
		 			client2.follow(user_id)
		 			counts[:follow] +=1
		 			#puts "Follow"

				else
 			 		rand_text = rand(2)
		 			if rand_text == 0
		 					text_promo = "Wanna save 5€ on your next Uber ride? You can get it with the discount code g0afm https://www.uber.com/invite/g0afm"
		 			elsif rand_text == 1
							text_promo = "Wanna earn 5€ during your next Uber ride? You can get it with the discount code g0afm https://www.uber.com/invite/g0afm"
					else
							text_promo = "Do you want a bonus of 5€ on your Uber account? You can get it with the discount code g0afm https://www.uber.com/invite/g0afm"	
		 			end
		 		
		 			client2.update("@#{object.user.screen_name} #{text_promo}", in_reply_to_status_id: status_identity)
					counts[:reply] +=1
					#puts "Reply"
				end
		end
		#Display what have been done since the launch of the bot
		puts "Until now: #{counts}"

	end



=begin



#Connexion REST API

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""

end
	# Above Log into Twitter services


	#Tweet from command line
	client.update('Tu veux économiser 5 euros sur ton prochain déplacement Uber? #minikiff Tu peux le faire avec le code g0afm')



	#Method: client.search("query", {options})
	client.search("#ruby").take(50).each do |tweet|
	  puts tweet.text
	end


	# test search option with geo localisation
	search_options = {
	  result_type: "recent",
	  geocode: "39.9525839,-75.1652215,10mi"
	}
	client.search("pope", search_options).take(50).each do |tweet|
	  puts "#{tweet.user.screen_name}: #{tweet.text}"
	end

	#Search option with Hitchbot
	search_options = {
	  result_type: "recent",
	  geocode: "39.9525839,-75.1652215,10mi"
	}
	client.search("#hitchbot", search_options).take(10).each do |tweet|
	  puts "#{tweet.user.screen_name}: #{tweet.text}"
	  client.favorite(tweet)
	  client.update("@#{tweet.user.screen_name} Avenge me...",
	                in_reply_to_status_id: tweet.id)
	end


=end


#Bot streaming specific accounts linked 









require 'twitter'


def bot_news (journal,nb_journalists)

	client2 = Twitter::REST::Client.new do |config2|
		#put API authentification here
	end


#Build a first journalist list from newspaper "journal" including "nb_journalists" journalists, having the name of the journal in their description
	list_journalists = []
	list_journalists = client2.user_search(journal,options = {:count => nb_journalists})

#Build a list with the user names
	list_journalists2 = []
	list_journalists.each do  |i|
	list_journalists2 << {:id => i,:user_name => client2.user(i).name, :user_screen_name => client2.user(i).screen_name, :user_id => client2.user(i).id}
	end


#Kick out the users that are streams from the newspaper for instance "Le Figaro Culture"
	list_journalists3 = []
	list_journalists2.each do |j|
		#puts j[:user_name]
		if !(j[:user_name].include? journal[1..-1].gsub("_", " "))
			list_journalists3 << j
		end

	end

#For each "journalist" in the list_journalists3 do a random action, either 
	list_journalists3.each do |k|
		
		# test timeline / puts client2.user_timeline(k[:id],{:count => 5})

		random_action = rand(4)
		puts random_action
		#Follow
		if random_action == 0
			client2.follow(k[:id])
		
		#Like 5 last tweets
		elsif random_action == 1
			#Get 5 last tweets
			tweets_journalist = []
			tweets_journalist = client2.user_timeline(k[:id],{:count => 5})
			
			#Retweet them
			tweets_journalist.each do |l|
				client2.favorite(l)
			end

		#Retweet
		elsif random_action == 2
			#Get 5 last tweet
			tweets_journalist = []
			tweets_journalist = client2.user_timeline(k[:id],{:count => 5})
			#Retweet them
			tweets_journalist.each do |l|
				client2.retweet(l)
			end
		
		#Tweet a message with their name
		elsif random_action == 3
			text_promo="tu connais The Hacking Project ? Je suis élève est c'est cool !"
			client2.update("@#{k[:user_screen_name]} #{text_promo}")
		#MP a predefinite message - non aplicable to persons not following you. To able, put rand(5) instead of rand(4) in random_action
		else random_action == 4
			inbox_message = ""
			client2.create_direct_message(k[:user_id], "Hey je suis élève à The Hacking Project et je voulais te parler de ma formation trop bien et tu as reçu ce message à partir d'un bot que j'ai codé moi même alors qu'il y a 10 jours je n'avais jamais écrit de ligne de code ! C'est dingue")

		end	

	end

end



bot_news("@NomJournalTweet", 20)


def chiffre_de_cesar (message,decalage)

 	#Si décalage supérieur à 26 alors 
 	if decalage>26 
 		decalage = decalage%26
	end
	

	# Scinder le message à coder lettre par lettre dans un tableau
	message_split = message.split(//)


	#Générer le tableau ascii correspondant au message à coder
	ascii_message=[]

	message_split.each do |x|
		if x== " " #Cas particulier de l'espace
			ascii_message << "\s".ord;
		else
			ascii_message << x.ord;
		end
		
	end;


	#Générer le tableau ascii correspondant au message codé, en utilisant la valeur de décalage
	ascii_code=[]
	ascii_message.each do |y|
		

		#Si une majuscule alors décaler de "décalage"
		if y >=65 && y <= (90 - decalage)
			ascii_code << y + decalage
		elsif y> (90- decalage) && y<=90
			ascii_code << (y-90) + 65 + decalage
		
		#Si une minuscule alors décaler de "décalage"
		elsif y >= 97 && y <= (122 - decalage)
			ascii_code << y + decalage
		elsif y> (122- decalage) && y<=122
			ascii_code << (y-90) + 65 + decalage

		#Sinon conserver le même code ascii
		else
			ascii_code << y
		end

	end
		

	#Générer le message codé
	code=""
	
	ascii_code.each do |z|
		code<<z.chr
	end

puts code		

end



#Définir message et decalage en interaction avec l'utilisateur et lancer la fonction code de César
	puts "Quel message souhaitez vous chiffrer?"
	message1 = gets
	puts "Quelle clé de chiffrage souhaitez vous utilisez (nombre entier supérieur ou égal à 0)"
	decalage1 = gets.to_i


chiffre_de_cesar(message1,decalage1)
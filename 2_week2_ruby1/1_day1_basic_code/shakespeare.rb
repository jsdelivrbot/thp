def jean_michel_data(corpus,dictionnaire)

	#On créé un hash "compteur" qui recevra pour chaque mot du dictionnaire son nombre d'apparition
	compteur = {}


	#On enlève la ponctuation et les majuscules du corpus et on le transforme en tableau
	corpus_transformed1 = corpus.downcase
	corpus_transformed2 = corpus_transformed1.scan(/[\w']+/)

	#Pour chaque mot du dictionnaire on parcourt tout le corpus transformé et on compte les mots

	dictionnaire.each do |i|
		
		#On initialise le hash pour le mot du dico i à 0
		compteur[i] = 0

		#Augmente le compteur si i (dico) est inclus dans j (mot du texte)
		corpus_transformed2.each do |j|
			if j.include?(i)
				compteur[i] += 1
			end
		end

	end

	#Renvoie le compteur
	puts compteur

end



#Fonction : ouverture fichier texte et conversion en string
def get_file_as_string(filename)
  data = ''
  f = File.open(filename, "r") 
  f.each_line do |line|
    data += line
  end
  return data

end


#Fonction pour compter les "gros mots" dans un texte sur la base d'un dictionnaire et d'un texte, par ex corpus intégral shakespeare
def shakespeare_words (filename,dictionnaire)

	corpus= get_file_as_string(filename)

	jean_michel_data(corpus,dictionnaire)

end 

#TEST JEAN MICHEL DATA
#jean_michel_data "Il il was wasas fois il une dnj fois fois",["il","was"]

#shakespeare_words("shakespeare.txt", ["the", "of", "and", "to", "a", "in", "for", "is", "on", "that", "by", "this", "with", "i", "you", "it", "not", "or", "be", "are"])
shakespeare_words("shakespeare.txt", ["thee","love","hatred","kindred","murder"])




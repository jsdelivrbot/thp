def somme_multiples(nombre)

	#Initialiser la variable qui contiendra la somme
	a = 0;

	#Initialiser la variable qui contiendra les multiples de 3 et 5 (ie multiples de 15)
	b = 0;

	#Limiter la recherche des multiples - ce multiples fois 3 ou 5 ne peut être supérieur à 1000
	max_multiple_3 = (nombre-1)/3;
	max_multiple_5 = (nombre-1)/5;
	max_multiple_15 = (nombre-1)/15;

	#Parcourir les nombres et si c'est un multiple de 3 ou 5, le rajouter à la liste des multiples de 3
	
	# Optimisation, ne pas regarder si multiple de 5 si sup à max_multiple 5
	1.upto(max_multiple_5) do |z|
			a+=z*3;
			a+=z*5;
	end;

	((max_multiple_5+1)..max_multiple_3).each do |y|
			a+=y*3
	end;
 	
 	# Calcul multiples de 15
	1.upto(max_multiple_15) do |x|
			b+=x*15;
	end;


puts a-b

end;

somme_multiples 1000;
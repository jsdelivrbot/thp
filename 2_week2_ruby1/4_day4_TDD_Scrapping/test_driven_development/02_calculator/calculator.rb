#write your code here

#Fonction addition
def add (num1,num2)
	num1+num2	
end

#Fonction soustraction
def subtract (num1,num2)
	num1-num2
end

#Fonction somme
def sum (array)
	#Retourner 0 si array vide
	if array.length == 0
		0
	#Retourner la somme sinon
	else
		(array).inject {|sum, n| sum + n }
	end	
end

#Fonction multiplier
def multiply(array)

	#Retourner 0 si array vide
	if array.length == 0
		0
	#Retourner la somme sinon
	else
		(array).inject {|prod, n| prod * n }
	end	
end


#Fonction Power (puissance) - deux inputs
def power (num1, num2)
	num1**num2
end

#Fonction Factorielle
def factorial (num)
	factor = 1
	
	if num == 0
		factor = 0
	else
		(1..num).each do |i|
			factor *= i
		end
	end

	factor
end
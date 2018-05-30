#Set the required gems for scrapping / parsing
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'HTTParty'
require 'Pry'

#  Define  a method to get data from coinmarketcap.com
def get_all_crypto_names_and_trading_values 
	begin
		
		# Get html text from the url given
		page = HTTParty.get("https://coinmarketcap.com/")
		parse_page = Nokogiri::HTML(page)
	
		#Get crypto data names and put it in an array of hashes called crypto_data
		xpath = '//td[@class="no-wrap currency-name"]/ a[@class="currency-name-display"]'
		crypto_name_html = parse_page.xpath(xpath)
		
		crypto_data =[]
		crypto_name_html.each {|i| crypto_data << {:name => i.text, :value => 0}}
		
		#Get for each crypto-currency the trading value
		xpath_crypto = '//a[@class="price"]/ @data-usd'
		crypto_trading_value = parse_page.xpath(xpath_crypto)

		#Fill the array of hash containing all the values	
		(0..(crypto_data.length-1)).each do |j|
			crypto_data[j][:value] = crypto_trading_value[j].text.to_f
		end
		puts crypto_data
		crypto_data



	rescue => e
	  puts "Exception Class: #{ e.class.name }"
	  puts "Exception Message: #{ e.message }"
	  puts "Exception Backtrace: #{ e.backtrace }"
	end
end

#Get all crypto trading values in a never ending loop, getting values every 3600 seconds and link it to a global value
def get_crypto_names_and_trading_values_every_y_seconds (y)

	(0..100).each { |i|
		$x = get_all_crypto_names_and_trading_values
		puts $x
		puts "round#{i}"
		sleep(y);
	}
end


#Calculate the total value of each crypto detained and total value of a wallet. 
#Calls method get_all_crypto_names_and_trading_values
def wallet_value_calculator (array)
	lenght_wallet = array.length

	#Initiate the two things we want to calculate: total value and each the value of each crypto detained
	total_wallet_value = 0
	crypto_wallet_value = []

	#Get all trading values and names of top 100 crypto currencies
	#HEEEERE
	crypto_trading_values = get_all_crypto_names_and_trading_values


	

	#Build a wallet overview
	wallet_overview = array
	#Initiate trading value from CoinMarketCap
	trading_value_now = 0
	#Get each trading value for each cryptocurrency, calculate the value owned of each crypto currency and the total value of wallet
	(0..(lenght_wallet-1)).each do |i|
		trading_value_now = crypto_trading_values.select {|y| y[:name] == wallet_overview[i][:crypto_name]}
		wallet_overview[i][:value_owned] = wallet_overview[i][:number_crypto] * trading_value_now[0][:value]
		total_wallet_value += wallet_overview[i][:value_owned]
	end
	

	#Displays value of wallet
	puts wallet_overview
	puts "Your wallet value totals " + total_wallet_value.to_s + " $"
end



#Define a hypothetical wallet, crypto_names need to match the names of CoinMarketCap.com
x = [
	{:crypto_name =>"Ripple",:number_crypto =>900.0},
	{:crypto_name =>"Litecoin",:number_crypto => 1.4},
	{:crypto_name =>"NEO",:number_crypto =>3.0},
	{:crypto_name =>"Iconomi",:number_crypto =>35.0},
	{:crypto_name =>"Monero",:number_crypto =>1.04},
	{:crypto_name =>"EOS",:number_crypto =>100.0},
	{:crypto_name =>"Melon",:number_crypto =>1.67},
	{:crypto_name =>"IOTA",:number_crypto =>60.0}
]

#Tests
wallet_value_calculator (x)

=begin
get_crypto_names_and_trading_values_every_y_seconds(5)

get_all_crypto_names_and_trading_values
=end



require 'rubygems'
require 'json'
require 'pp'

def parse_json_file(file_name)
	
	json = File.read(file_name)
	obj = JSON.parse(json)
	

	#optional
	p obj.class
	pp obj
	#return transformed jason file
	return obj
end

parse_json_file("json_mairie.json")
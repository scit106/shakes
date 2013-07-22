class Play < ActiveRecord::Base
  attr_accessible :title, :source
  
  require 'open-uri'

def self.play_parser
	source = 'http://www.cafeconleche.org/examples/shakespeare/j_caesar.xml' #need to replace with variable
	xml_string = RestClient.get(source)
	@parsed_string = Crack::XML.parse(xml_string)

	return @parsed_string
end

def self.play_title
	@name = play_parser["PLAY"]["TITLE"]

	return @name
end

#This returns the character names from the intro, but not the names used for lines
def self.play_personae
	#returns an array of non-grouped characters
	@personae_main = play_parser["PLAY"]["PERSONAE"]["PERSONA"]
	@personae_groups = play_parser["PLAY"]["PERSONAE"]["PGROUP"]

	@personae = @personae_main
	@personae_groups.each do |x|
		@personae += x["PERSONA"]
	end

	return @personae
end

end

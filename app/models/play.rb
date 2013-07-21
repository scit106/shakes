class Play < ActiveRecord::Base
  attr_accessible :title, :source
  
  require 'open-uri'

def self.play_parser
	source = 'http://www.cafeconleche.org/examples/shakespeare/j_caesar.xml' #need to replace with variable
	xml_string = RestClient.get(source)
	parsed_string = Crack::XML.parse(xml_string)

	return parsed_string
end

# def self.play_title
# 	name = play_parser.at_xpath("TITLE").text
# end

# def self.play_persona
# 	character = play_parser.at_xpath("PERSONAE/*/PERSONA").each do |p|
# 		p.text
# 	end
# end

end

class Play < ActiveRecord::Base
  attr_accessible :title, :source
  
  require 'open-uri'

def self.play_parser
	xml_string = Nokogiri::XML(open('http://www.cafeconleche.org/examples/shakespeare/j_caesar.xml'))
	root = xml_string.root
end

def self.play_title
	name = play_parser.at_xpath("TITLE").text
end

# def self.play_persona
# 	character = play_parser.at_xpath("PERSONAE/*/PERSONA").each do |p|
# 		p.text
# 	end
# end

end

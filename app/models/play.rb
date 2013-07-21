class Play < ActiveRecord::Base
  attr_accessible :title, :source
  
  require 'open-uri'

def self.play_parser
	xml_string = Nokogiri::XML(open(:source))
	root = xml_string.root
end

def self.play_title
	name = play_parser.at_xpath("TITLE").text
end

end

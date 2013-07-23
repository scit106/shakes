class Play < ActiveRecord::Base
  attr_accessible :title, :source
  has_many :acts

  require 'open-uri'


def self.build source
	play = Play.new
	play.source = source
	xml_string = RestClient.get(source)
	parsed_hash = Crack::XML.parse(xml_string)
	# play.acts 
	parsed_hash["PLAY"]["ACT"].each do |act|
			Act.build act
		end
		# rubydocs - array, hashes, enumerations
		# grab acts
		# pass to act builder
	play.title = parsed_hash["PLAY"]["TITLE"]

	return play
end


def self.sample
	source = 'http://www.cafeconleche.org/examples/shakespeare/j_caesar.xml'
	xml_string = RestClient.get(source)
	parsed_hash = Crack::XML.parse(xml_string)
		acts = parsed_hash["PLAY"]["ACT"]
		# play.acts
		# parsed_hash["PLAY"]["ACT"].each do |act|
		# 	play.acts << Act.build act
		# end
		# rubydocs - array, hashes, enumerations
		# grab acts
		# pass to act builder
	title = parsed_hash["PLAY"]["TITLE"]

	return acts
end

# def self.play_title
# 	@name = play_parser["PLAY"]["TITLE"]

# 	return @name
# end

# #This returns the character names from the intro, but not the names used for lines
# def self.play_personae
# 	#returns an array of non-grouped characters
# 	personae_main = play_parser["PLAY"]["PERSONAE"]["PERSONA"]
# 	personae_groups = play_parser["PLAY"]["PERSONAE"]["PGROUP"]
# 	@personae = personae_main

# 	personae_groups.each do |x|
# 		@personae += x["PERSONA"]
# 	end

# 	return @personae
# end

# #to get an array of all SPEAKERS in the play, that is each character who has lines
# def self.speakers
# 	# @speaker = Array.new

# 	a = play_parser["PLAY"]["ACT"] #this is an array with all acts

# 	scenes_array = Array.new
# 	# b = Hash.new
# 	speeches_array = Array.new
# 	speakers_array = Array.new
# 	a.each do |x|
# 		scenes_array += x["SCENE"]
# 	end

# 	# b = scenes_array.flatten
# 	# b = scenes_array[0]
# 	# scenes_array.each do |y|
# 	# 	speeches_array += y["SPEECH"]
# 	# end


# 	return scenes_array
# 	# return @speaker
# end

end

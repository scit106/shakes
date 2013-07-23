class PlaysController < ApplicationController
	def index
		@plays = Play.all
	end

	def new
		@play = Play.new
	end

	def create
		play = Play.build(params[:play][:source])
		play.save

		redirect_to plays_path
	end


end

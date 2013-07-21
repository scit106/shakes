class PlaysController < ApplicationController
	def index
		@plays = Play.all
	end

	def new
		@play = Play.new
		@title = Play.play_title
	end

	def create
		@play = Play.new(params[:play])

	respond_to do |format|
			if @play.save
				redirect_to plays_path
            else
			    format.html  { render :action => "new" }
			    format.json  { render :json => @play.errors,
			                    :status => :unprocessable_entity }
			end
		end
	end


end

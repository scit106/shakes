class PlaysController < ApplicationController
	def index
		@plays = Play.all
	end

	def new
		@play = Play.new
	end

	def create
		@play = Play.new(params[:play])
		@title = Play.play_title

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

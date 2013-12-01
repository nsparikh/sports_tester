class PollsController < ApplicationController

 	def index
    	redirect_to poll_path
  	end

	def show
	    @poll = Poll.find(params[:id])
	end
	  
	def new
	    @poll = Poll.new
	end

	def create
		init_params = poll_params
		@poll = Poll.create(init_params)
		if @poll.save
			redirect_to @poll
		else
			render 'new'
		end
	end

	private
		def poll_params
			params.require(:poll).permit(:teamAWins, :teamALosses, :teamAPointsFor, 
				:teamAPointsAgainst, :teamALocation, :teamBWins, :teamBLosses, 
				:teamBPointsFor, :teamBPointsAgainst, :teamBLocation)
		end

end

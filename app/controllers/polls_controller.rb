class PollsController < ApplicationController

 	def index
		@polls = Poll.paginate(page: params[:page])
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

	def destroy
		@poll = Poll.find(params[:id])
		@poll.destroy
		redirect_to root_path
	end

	def responses
		@responses = Response.paginate(page: params[:page])
	end

	def results_alt
	end


	private
		def poll_params
			params.require(:poll).permit(:id, :teamAName, :teamAWins, :teamALosses, 
				:teamAPointsFor, :teamAPointsAgainst, :teamALocation, 
				:teamBName, :teamBWins, :teamBLosses, :teamBPointsFor, 
				:teamBPointsAgainst, :teamBLocation)
		end

end

class PollsController < ApplicationController

 	def index
    	redirect_to root_path
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

	def create_file(filename)
	  	File.open(filename, 'w') do |f| 
	  		f.puts "Results:\n\n" 
	  	end
	end
	helper_method :create_file

	def write_to_file
		pollQuestion = params[:pollQuestion]
		result = params[:result]
		filename = params[:filename]

		File.open(filename, 'w') do |f|
			f.puts pollQuestion+": "+result
		end

		if pollQuestion.to_i < 3
			redirect_to '/polls/'+(pollQuestion.to_i+1).to_s
		else
			redirect_to '/done'
		end
	end


	private
		def poll_params
			params.require(:poll).permit(:id, :teamAName, :teamAWins, :teamALosses, 
				:teamAPointsFor, :teamAPointsAgainst, :teamALocation, 
				:teamBName, :teamBWins, :teamBLosses, :teamBPointsFor, 
				:teamBPointsAgainst, :teamBLocation)
		end

end

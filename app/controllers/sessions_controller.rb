class SessionsController < ApplicationController

	require 'net/smtp'

	def new
		session[:filename] = create_file
	end

	def write_to_file
		pollQuestion = params[:pollQuestion]
		result = params[:result]

		File.open(session[:filename], 'a') do |f|
			f.puts "Question "+pollQuestion+": "+result
		end

		if pollQuestion.to_i < Poll.count
			redirect_to '/polls/'+(pollQuestion.to_i+1).to_s
		else
			redirect_to done_path
		end
	end

	def destroy
		# TODO: send results somewhere
	  	File.open('app/views/sessions/results.html.erb', 'a') do |f1| 
  			f1.puts '<h2 class="center">'+session[:filename]+'</h2>'
	  		File.open(session[:filename], 'r') do |f2|
	  			while line = f2.gets
	  				f1.puts '<p>'+line+'</p>'
	  			end
	  		end
	  		f1.puts '<br/>'
	  	end
	end

	private
		def create_file
			filename = 'results/Results'+(Time.now.to_f * 1000).to_i.to_s+'.txt'
		  	filename
		end
end



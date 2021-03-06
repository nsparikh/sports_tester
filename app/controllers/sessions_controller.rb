class SessionsController < ApplicationController

	def new
		res_title = (Time.now.to_f * 1000).to_i.to_s
		session[:res_title] = res_title
		current_result = Response.new(:title => res_title)
		current_result.save

		#File.open('app/views/polls/results_alt.html.erb', 'a') do |f|
		#	f.write("<br/>" + res_title + "<br/>")
		#end
	end

	def write_to_file
		pollQuestion = params[:pollQuestion]
		result = params[:result]

		current_result = Response.find_by(title: session[:res_title])
		current_result[("q"+pollQuestion).to_sym] = result
		current_result.save

		#File.open('app/views/polls/results_alt.html.erb', 'a') do |f|
		#	f.write("Question " + pollQuestion.to_s + ": " + result + "<br/>")
		#end


		if pollQuestion.to_i < Poll.count
			redirect_to '/polls/'+(pollQuestion.to_i+1).to_s
		else
			redirect_to done_path
		end
	end

	def destroy
		current_result = Response.find_by(title: session[:res_title])
		current_result.save
	end
end






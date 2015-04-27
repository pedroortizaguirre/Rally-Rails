	class RallyController < ApplicationController
		
		def index			
			@workspace=Rally.display_workspace
		end

		def show
			@projects=Rally.display_projects(params[:id])
		end

		def show_projects
			@projects=Rally.display_projects(params[:name])
		end

		def details		
			@iterations=Rally.display_iterations(params[:id])		
			# @user_stories= Rally.display_user_stories(params[:id])
			
			puts "#{@iterations.inspect}<<<<<<<<<<<"
		end

		def show_user_stories 
			@user_stories= Rally.display_user_stories(params[:id])
		end

		def show_bugs
			if params[:id]
				@bugs= Rally.display_iteration_bugs(params[:id])
			end		
		end
	end

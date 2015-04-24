	class RallyController < ApplicationController
		
		def index			
			@results=Rally.display_iterations
		end

		def show
			@user_stories= Rally.display_user_stories(params[:id])
			if params[:id]
				@bugs= Rally.display_iteration_bugs(params[:id])
			end			

		end



end

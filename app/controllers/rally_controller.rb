	class RallyController < ApplicationController
		
		def index			
			@workspace=Rally.display_workspace
		end

		def show
			@projects=Rally.display_projects(params[:id])
		end

		def details		
			@iterations=Rally.display_iterations(params[:id])		
			@user_stories= Rally.display_user_stories(params[:id])	
			@bugs= Rally.display_iteration_bugs(params[:id])		
			
			@PlanEstimate= 0.0
			@TaskEstimateTotal= 0.0
			@TaskActualTotal= 0.0

			@user_stories.each do |i|
				@PlanEstimate = @PlanEstimate + i.PlanEstimate.to_f
				@TaskEstimateTotal= @TaskEstimateTotal + i.TaskEstimateTotal.to_f
				@TaskActualTotal= @TaskActualTotal + i.TaskActualTotal.to_f
				puts "#{@PlanEstimate.inspect}<<"
			end
		end

		def show_bugs
			if params[:id]
				@bugs= Rally.display_iteration_bugs(params[:id])
			end		
		end
	end

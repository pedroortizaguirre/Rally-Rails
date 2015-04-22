	class RallyController < ApplicationController
		
		def index
			headers = RallyAPI::CustomHttpHeader.new({:vendor => "Vendor", :name => "MindGT Admin", :version => "1.0"})
			config = {:base_url => "https://rally1.rallydev.com/slm"}
			config[:api_key]   = "_01s48oJoTiqbNYHd0FyBeBu7OKFF0aGruXSBT21GOQ"
			config[:workspace] = "Internal Development Group"
			config[:project]    = "MindGT Admin"
			config[:headers]    = headers 

			rally = RallyAPI::RallyRestJson.new(config)

			defect_query = RallyAPI::RallyQuery.new()
			defect_query.query_string ='(Iteration.Name = "IT-4 24/Mar-6/Apr Profile & Team Pages")'
			defect_query.type = "hierarchicalrequirement"
			defect_query.fetch = "Name,FormattedID,ScheduleState,PlanEstimate,Iteration,TaskActualTotal,TaskEstimateTotal,Tasks"
  		# 	defect_query.limit      = 10          #optional - default is 99999
 			# defect_query.page_size  = 10
  			defect_query.project_scope_up = false
  			defect_query.project_scope_down = true
  			#defect_query.order = "FormattedID Desc"

			@results = rally.find(defect_query)
		end

end

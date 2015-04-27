class Rally < ActiveRecord::Base
	
	headers = RallyAPI::CustomHttpHeader.new({:vendor => "Vendor", :name => "MindGT Admin", :version => "1.0"})
	@config = {:base_url => "https://rally1.rallydev.com/slm"}
	@config[:api_key]   = "_zPObD41eQb2Gyow8xgae0w1Jik3M0ychJKnCwSzIBU"
	@config[:workspace] = "Internal Development Group"
	#@config[:project] = "MindGT Admin"
	@config[:headers]    = headers 


	def self.display_workspace
		rally = RallyAPI::RallyRestJson.new(@config)
		defect_query = RallyAPI::RallyQuery.new()
		defect_query.type = "Workspace"
		defect_query.fetch = "Name,Projects,FormattedID,ObjectID"
		defect_query.project_scope_up = false
		defect_query.project_scope_down = true 

		workspace = rally.find(defect_query)

	end

	def self.display_projects(id)
		rally = RallyAPI::RallyRestJson.new(@config)
		defect_query = RallyAPI::RallyQuery.new() 			
		defect_query.query_string ="(ObjectID = #{id})"
		defect_query.type = "Projects"
		defect_query.fetch = "Name,FormattedID,ObjectID,Iterations"
		defect_query.project_scope_up = false
		defect_query.project_scope_down = true 

		projects = rally.find(defect_query)
	end

	def self.display_iterations(id)
		rally = RallyAPI::RallyRestJson.new(@config)
		defect_query = RallyAPI::RallyQuery.new()
		defect_query.query_string ="(ObjectID = #{id})"
		defect_query.type = "Iteration"
		defect_query.fetch = "ObjectID,EndDate,Name,State,PlannedVelocity,Project,StartDate,PlanEstimate"
 		iterations = rally.find(defect_query)
 	end 

 	def self.display_user_stories(id)
 		rally = RallyAPI::RallyRestJson.new(@config)
 		defect_query = RallyAPI::RallyQuery.new()
 		defect_query.query_string ="(Iteration.ObjectID = #{id})"
 		defect_query.type = "hierarchicalrequirement"
 		defect_query.fetch = "Name,FormattedID,PlanEstimate,TaskActualTotal,TaskEstimateTotal,Owner,ScheduleState"
  			
  			#defect_query.limit      = 10          #optional - default is 99999
 			# defect_query.page_size  = 10
 			defect_query.project_scope_up = false
 			defect_query.project_scope_down = true 
 			defect_query.order = "FormattedID Desc" 			
 			user_stories = rally.find(defect_query)
 		end 

 		def self.display_all_bugs
 			rally = RallyAPI::RallyRestJson.new(@config)
 			defect_query = RallyAPI::RallyQuery.new()
 			defect_query.type = "Defect"
 			defect_query.fetch = "Name,FormattedID,Environment,Iteration,Owner,State,Severity,SubmittedBy,Priority"
 			defect_query.project_scope_up = false
 			defect_query.project_scope_down = true 
 			defect_query.order = "FormattedID Desc" 			
 			bugs = rally.find(defect_query)

 		end

 		def self.display_iteration_bugs(id)
 			rally = RallyAPI::RallyRestJson.new(@config)
 			defect_query = RallyAPI::RallyQuery.new()
 			defect_query.query_string ="(Iteration.ObjectID = #{id})"
 			defect_query.type = "Defect"
 			defect_query.fetch = "Name,FormattedID,Environment,Iteration,Owner,State,Severity,SubmittedBy,Priority"
  			#defect_query.limit      = 10          #optional - default is 99999
 			# defect_query.page_size  = 10
 			defect_query.project_scope_up = false
 			defect_query.project_scope_down = true 
 			defect_query.order = "FormattedID Desc" 			
 			bugs = rally.find(defect_query)

 		end

 	end

require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

get("/") do
  @projects = Project.all()
  erb(:index)
end

post("/projects") do
  title = params["title"]
  project = Project.new({:title => params['title']}).save
  @projects = Project.all()
  erb(:index)
end

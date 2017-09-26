require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

get('/') do
  @projects = Project.all()
  @volunteers = Volunteer.all()
  erb(:index)
end

post('/') do
  Project.new({:title => params['title']}).save
  Volunteer.new({:name => params['name'], :project_id => params['project_id']}).save
  redirect('/')
end

post('/projects') do
  Project.new({:title => params['title']}).save
  redirect('/')
end

post('/volunteers') do
  Volunteer.new({:name => params['name'], :project_id => params['project_id']}).save
  redirect('/')
end

get('/projects/:id') do
  @project = Project.find(params[:id])
  erb(:projects)
end

get('/volunteers/:id') do
  @volunteers = Volunteer.find(params[:id])
  erb(:volunteers)
end

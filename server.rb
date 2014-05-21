require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/public' 
set :views, File.dirname(__FILE__) + '/views'

def get_tasks
  tasks = File.readlines('tasks.txt') 
end

get '/' do 
  @tasks = get_tasks
  erb :index
end

get '/tasks' do
  @tasks = get_tasks
  erb :index
end

get '/tasks/:task_name' do
  @task = params[:task_name]
  erb :show
end

post '/add_task' do
  new_task = params['new_task_name']
  File.open('tasks.txt', 'a') {|f| f.puts(new_task)}
  redirect '/'
end


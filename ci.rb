require 'sinatra'
require_relative 'models/project'

get '/' do
  @projects = Project.retreive_all
  erb :index
end

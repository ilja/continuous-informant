require 'sinatra'
require_relative 'models/project'

if ENV["TEAMCITY_URL"]
  set :teamcity_url, ENV["TEAMCITY_URL"]
else
  raise "Please add TEAMCITY_URL as an environment variable."
end

if ENV["JENKINS_URL"]
  set :jenkins_url, ENV["JENKINS_URL"]
else
  raise "Please add JENKINS_URL as an environment variable."
end

get '/' do
  @projects = Project.retreive_all
  erb :index
end

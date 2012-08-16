require_relative 'jenkins_parser'
require_relative 'teamcity_parser'

class Project
  attr_accessor :name, :status

  def initialize(attributes={})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def self.retreive_all
    projects = []
    projects += JenkinsParser.new(settings.jenkins_url).parse
    projects += TeamcityParser.new(settings.teamcity_url).parse
    projects
  end
end

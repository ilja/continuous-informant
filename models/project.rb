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
    projects += JenkinsParser.new("http://rizzo:8081/api/xml").parse
    projects += TeamcityParser.new("http://scooter:666").parse
    projects
  end
end

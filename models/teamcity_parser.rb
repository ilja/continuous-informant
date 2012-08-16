require 'faraday'

class TeamcityParser
  def initialize(url)
    @url = url
  end

  def parse
    response = Faraday.new(:url => @url).get '/guestAuth/app/rest/cctray/projects.xml'

    projects = []

    Nokogiri::XML(response.body).xpath('//Project').each do |project_node|
      projects << Project.new(name: project_node['name'],
                            status: parse_build_status(project_node['lastBuildStatus']))
    end

    projects
  end

  private

  def parse_build_status(buildstatus)
    if buildstatus == "Success"
      return :success
    elsif buildstatus == "Failure"
      return :failing
    end
    return :unknown
  end

end

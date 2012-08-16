require 'open-uri'
require 'nokogiri'

class JenkinsParser
  def initialize(url)
    @url = url
  end

  def parse
    doc = Nokogiri::XML(open(@url + "/api/xml"))

    projects = []

    doc.xpath('//job').each do |project_node|
      status = parse_build_status_from_color(project_node.css('color').text)
      projects << Project.new(name: project_node.css('name').text, status: status)
    end

    projects
  end

  private

  def parse_build_status_from_color(color_status)
    case color_status
    when /blue/
      return Status::SUCCESS
    when /red/
      return Status::FAILING
    end
    return Status::UNKNOWN
  end

end

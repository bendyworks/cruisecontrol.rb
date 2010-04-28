require 'fileutils'

class PostedBuildTrigger
  
  def initialize(triggered_project, opts={})
    @triggered_project = triggered_project
  end
  
  def build_necessary?(reasons)
    proj = @triggered_project
    path = (proj.path + '/poll_requested')
    Rails.logger.warn "POSTED FILE: #{path}"
    should_build = File.exists?(path)
    FileUtils.rm(path) if should_build
    should_build
  end

end

class SiteController < ApplicationController
  def home
  	  @now = DateTime.now.utc
    @now= @now.in_time_zone('Eastern Time (US & Canada)')
  end
  def profile
  end

end

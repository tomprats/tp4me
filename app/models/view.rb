class View < ApplicationRecord
  validates :link_id, presence: true

  belongs_to :link, counter_cache: :total_views

  before_create :set_data

  private
  def set_data
    self.computed_data ||= {}
    puts raw_data
    set_location
    set_user_agent
  end

  def set_location
    location = Geocoder.address raw_data[:remote_ip]
    self.computed_data[:location] = {
      city: location.city,
      state: location.state,
      country: location.country
    }
  rescue => e
    puts e.message
    puts "No Location Data Recorded"
  end

  def set_user_agent
    agent = UserAgentParser.parse raw_data[:user_agent]
    device = agent.device
    os = agent.os
    self.computed_data[:browser] = {
      family: agent.family,
      version: user_agent.version.to_s,
      minor_version: user_agent.version.minor,
      major_version: user_agent.version.major
    }
    self.computed_data[:device] = {
      family: device.family
    }
    self.computed_data[:os] = {
      family: os.family,
      version: os.version.to_s,
      minor_version: os.version.minor,
      major_version: os.version.major
    }
  rescue => e
    puts e.message
    puts "No User Agent Data Recorded"
  end
end

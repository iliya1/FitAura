# Load the Rails application.
require File.expand_path('../application', __FILE__)

Date::DATE_FORMATS[:default]="%m/%d/%Y"
Time::DATE_FORMATS[:default]="%m/%d/%Y %H:%M"

# Initialize the Rails application.
Rails.application.initialize!

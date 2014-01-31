# Load the Rails application.
require File.expand_path('../application', __FILE__)

Time::DATE_FORMATS[:dataBr] = "%b, %m %Y"

# Initialize the Rails application.
SIVIC::Application.initialize!

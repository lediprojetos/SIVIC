# Load the Rails application.
require File.expand_path('../application', __FILE__)

Time::DATE_FORMATS[:dataBr] = "%d, %m %Y"

# Initialize the Rails application.
SIVIC::Application.initialize!

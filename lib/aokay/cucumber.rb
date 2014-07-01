require 'cucumber'
require 'aokay'

Aokay.register_drivers

World(Aokay)

After('@aokay') do
  # Clear out network traffic?
end

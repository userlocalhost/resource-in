$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'resource_in'

Dir.glob("spec/steps/**/*steps.rb") { |f| load f, true }

RSpec.configure do |config|
  config.after(:type => :feature) do
    ## nope
  end
end

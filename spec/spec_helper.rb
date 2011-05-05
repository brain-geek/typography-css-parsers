require 'rubygems'
require 'bundler'
Bundler.require(:default, :development)

class RSpec::Core::ExampleGroup
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper
end
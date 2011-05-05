require 'autotest/restart' # optional: forces autotest to pick the changes to this file
require 'autotest/timestamp' # optional: shows timestamps for test runs

Autotest.add_discovery { "rspec2" }

Autotest.add_hook :initialize do |at|
  %w{.git .svn .hg .DS_Store ._*}.each do |exception|
    at.add_exception(exception)
  end
end

source "https://rubygems.org"

gem "eventmachine", :git => "https://github.com/cloudfoundry/eventmachine.git", :branch => "release-0.12.11-cf"
gem "em-http-request", "~> 1.0.0.beta.3", :require => "em-http"

gem "em-warden-client", :git => "https://github.com/cloudfoundry/warden.git", :ref => "72fa69ea"
gem "warden-client", :git => "https://github.com/cloudfoundry/warden.git", :ref => "72fa69ea"
gem "warden-protocol", :git => "https://github.com/cloudfoundry/warden.git", :ref => "72fa69ea"

gem "nats", :require => "nats/client"
gem "em-posix-spawn", :git => "https://github.com/cloudfoundry/common.git",   :ref => "3f6636fc"

gem "rack", :require => ["rack/utils", "rack/mime"]
gem "rake"
gem "thin"
gem "yajl-ruby", :require => ["yajl", "yajl/json_gem"]
gem "grape", :git => "https://github.com/intridea/grape.git"

gem "vcap_common", :git => "https://github.com/cloudfoundry/vcap-common.git", :ref => "5334b662"
gem "steno", :git => "https://github.com/cloudfoundry/steno.git"

group :test do
  gem "rspec"
  gem "rack-test"
  gem "rcov"
  gem "ci_reporter"
end

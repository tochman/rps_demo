require 'rubygems'
require File.join(File.dirname(__FILE__), 'lib/rps_demo.rb')

use Rack::Static, urls: ['/css', '/js', '/images', '/fonts'], root: 'assets'

run RPSDemo
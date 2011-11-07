require "rubygems"
require 'rack/contrib'
require 'rack-rewrite'

use Rack::Static, :root => "1"
use Rack::ETag
use Rack::Rewrite do
	rewrite '/', 'test.html'
	end
	run Rack::Directory.new('1')


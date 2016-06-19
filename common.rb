lib_dir = File.join(File.expand_path(File.dirname(__FILE__)), 'pb-ruby')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'logging'
require 'grpc'

require 'janus_services'

include Janus

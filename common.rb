lib_dir = File.join(File.expand_path(File.dirname(__FILE__)), 'pb-ruby')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

lib_dir = File.join(File.expand_path(File.dirname(__FILE__)), 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'securerandom'
require 'logging'
require 'grpc'

require 'janus_services'

require 'generators/mission'
require 'generators/mission_list'

include Janus

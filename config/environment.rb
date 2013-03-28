# Load the rails application
$KCODE = 'utf-8'
require File.expand_path('../application', __FILE__)
# TODO to resolve error without require openssl.
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# Initialize the rails application
Eedrops::Application.initialize!

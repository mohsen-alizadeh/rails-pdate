# encoding: utf-8

if RUBY_VERSION < '1.9'
  require "jcode"
  $KCODE = 'u'
end

require 'core_date'
require 'core_string'
require 'rails_pdate/pconvertor'
require 'rails_pdate/constants'
require 'rails_pdate/p_date'




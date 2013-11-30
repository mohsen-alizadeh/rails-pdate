# encoding: utf-8

require 'core_date'
require 'rails_pdate/pconvertor'
require 'rails_pdate/constants'


  if RUBY_VERSION < '1.9'
    require "jcode"
    $KCODE = 'u'
  end
  require "date"

  # :title:PDate (Persian Date) #
  class PDate
    def initialize *args

    end
  end

# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressNL
    include FFaker::Address

    extend ModuleUtils
    extend self

    POSTAL_CODE_FORMAT = ['#### ??']

    def postal_code
      FFaker.bothify POSTAL_CODE_FORMAT
    end

    def zip_code
      postal_code
    end

    def street_name
      name = [true, false].sample ? NameNL.last_name : NameNL.first_name
      name + random_type_of_street
    end

    def city
      CITY.sample
    end

    def province
      PROVINCE.sample
    end

    private

    def random_type_of_street
      case rand(20)
      when 0 then 'weg'
      when 1 then 'boulevard'
      when 3 then 'pad'
      when 4 then 'steeg'
      else 'straat'
      end
    end
  end
end

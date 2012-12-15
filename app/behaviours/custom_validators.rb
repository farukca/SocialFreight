module CustomValidators

	module Validators
    class AbsenceValidator < ActiveModel::EachValidator
    	def validate_each(record, attribute, value)
    		#record.errors.add(attribute, :invalid, options) unless value.blank?
    		record[:base] << "Some nasty things happened, call system admin" unless value.blank?
    	end
    end		
	end
	
end
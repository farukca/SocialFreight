module CustomValidators

	module Validators
    class AbsenceValidator < ActiveModel::EachValidator
    	def validate_each(record, attribute, value)
    		#record.errors.add(attribute, :invalid, options) unless value.blank?
    		record[:base] << "Some nasty things happened, call system admin" unless value.blank?
    	end
    end

    class CheckRegisteredValidator < ActiveModel::EachValidator
    	def validate_each(record, attribute, value)
    		registered_user = User.find_by_email(value) unless value.blank?
    		if registered_user
    			record.errors.add(attribute, :invalid, options) unless value.blank?
    		  #record.errors[:base] << "Mail zaten kullanimda"
    	  end
    	end
    end
	end
	
end
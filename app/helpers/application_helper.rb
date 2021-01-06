module ApplicationHelper

    def errors
        if flash[:errors]
            flash[:errors].each do |error|
                error 
            end 
        end
    end

end

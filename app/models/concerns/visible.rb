# A concern is only responsible for a focused subset of the model's responsibility; the methods in our concern will all be related to the visibility of a model. Let's call our new concern (module) Visible.
# We will store here all of the status methods that were duplicated in the models. 

module Visible
    extend ActiveSupport::Concern

    VALID_STATUSES = ["public", "private", "archived"]

    included do
        validates :status, inclusion: {in: VALID_STATUSES}
    end
    ### We can add our status validation to the concern, but this is slightly more complex as validations are methods called at the class level. The ActiveSupport::Concern (API Guide) gives us a simpler way to include them (using "included" method) :

    ###  the included method is part of the ActiveSupport::Concern module. It is used when defining concerns to execute code within the context of the class that includes the concern.
    
    class_methods do
        def public_count
            where(status: "public").count
        end
    end
    def archived?
        status == "archived"
    end
end


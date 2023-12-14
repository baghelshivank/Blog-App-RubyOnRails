class Comment < ApplicationRecord
  include Visible
  belongs_to :article #,  optional: true
  # When used alone, belongs_to produces a one-directional one-to-one connection. 

  # VALID_STATUSES = ["public", "private", "archived"]
  # validates :status, inclusion: {in: VALID_STATUSES}
  ## Above two lines of code moved to app/models/concerns/visible.rb

  private
    # def archived?
    #   status == "archived"
    # end
    ## Above three lines of code moved to app/models/concerns/visible.rb

end

# MODEL FILE

# A model is a Ruby class that is used to represent data. Additionally, models can interact with the application's database through a feature of Rails called Active Record.
# Model names are singular, because an instantiated model represents a single data record.

class Article < ApplicationRecord 
  include Visible

  # ********************* ASSOCIATIONS ================================================================================

  has_many :comments, dependent: :destroy
  # belongs_to :categories

  
  ### If you delete an article, its associated comments will also need to be deleted, otherwise they would simply occupy space in the database. Rails allows you to use the dependent option of an association to achieve this. 




  # ********************** VALIDATIONS ==============================================================================

  # validates :category, :title, :author, :body, presence: true

  validates :category, presence: true
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  # VALID_STATUSES = ["public", "private", "archived"]
  # validates :status, inclusion: {in: VALID_STATUSES}
  ## Above two lines of code moved to app/models/concerns/visible.rb


  # ********************* CALLBACKS ================================================================================

  # 1) Callback registration using macro-style class method : (Callbacks can also be registered to only fire on certain life cycle events)

  # before_validation :ensure_category_has_a_value, on: :create  
  before_validation :ensure_category_has_a_value, on: [:create, :update] 

  # 2) Callback registration using macro-style class method with a block : 
  # before_create do
  #   self.title = title.downcase.titleize
  #   puts "BEFORE CREATE ==============> "
  # end

  # 3) Callback registration passing a proc : 
  # before_create ->(article){article.title = title.downcase.titleize} 

  # 4) Callback registration using Custom callback object 

  after_validation :after_validation_callback 
  before_save :before_save_callback 
  # around_save :around_save_callback 
  before_create :before_create_callback
  # before_create CustomCallbackObject, on: [:create, :update] 
  # around_create :around_create_callback
  after_create :log_new_article 


  before_update :before_update_callback
  # around_update :around_update_callback 
  after_update :after_update_callback

  after_save :after_save_callback

  before_destroy :before_destroy_callback
  # around_destroy :around_destroy_callback
  after_destroy :after_destroy_callback

  after_commit :after_commit_callback
  after_rollback :after_rollback_callback




  private
    def ensure_category_has_a_value
      puts "BEFORE VALIDATION ==============> "
      if category.blank?
        self.category = "Trending"
      end
    end
    def after_validation_callback
      puts "AFTER VALIDATION ==============> "
    end
    def before_save_callback
      puts "BEFORE SAVE ==============> "
    end
    def around_save_callback
      puts "AROUND SAVE ==============> "
    end
    def before_create_callback
      puts "BEFORE CREATE ==============> "
      self.title = title.downcase.titleize
    end
    def around_create_callback
      puts "AROUND CREATE ==============> "
    end
    def log_new_article
      puts "A new article was registered ---------------------------------------------------------------------------------------"
      puts "AFTER CREATE ==============> "
    end


    def before_update_callback
      puts "BEFORE UPDATE ==============> "
    end
    def around_update_callback
      puts "AROUND UPDATE ==============> "
    end
    def after_update_callback
      puts "AFTER UPDATE ==============> "
    end


    def after_save_callback
      puts "AFTER SAVE ==============> "
    end


    def before_destroy_callback
      puts "BEFORE DESTROY ==============> "
    end
    def around_destroy_callback
      puts "AROUND DESTROY ==============> "
    end
    def after_destroy_callback
      puts "AFTER DESTROY ==============> "
    end


    def after_commit_callback
      puts "AFTER COMMIT ==============> "
    end
    def after_rollback_callback
      puts "AFTER ROLLBACK ==============> "
    end

    # def archived?
    #   status == "archived"
    # end
    ## Above three lines of code moved to app/models/concerns/visible.rb


end


# 4) Callback registration using Custom callback object 

# class CustomCallbackObject
#    self.before_create(article)
#       puts "BEFORE CREATE ==============> "
#       article.title = title.downcase.titleize
#    end
# end

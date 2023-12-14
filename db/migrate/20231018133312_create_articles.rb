# MIGRATION FILE

class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :category
      t.string :title
      t.string :author
      t.text :body

      t.timestamps
    end
  end
end

# Migrations are used to alter the structure of an application's database. In Rails applications, migrations are written in Ruby so that they can be database-agnostic. 

# The call to create_table specifies how the articles table should be constructed. By default, the create_table method adds an id column as an auto-incrementing primary key. So the first record in the table will have an id of 1, the next record will have an id of 2, and so on.

# Inside the block for create_table, two columns are defined: title and body. These were added by the generator because we included them in our generate command (bin/rails generate model Article title:string body:text).

# On the last line of the block is a call to t.timestamps. This method defines two additional columns named created_at and updated_at. As we will see, Rails will manage these for us, setting the values when we create or update a model object.

# Let's run our migration with the following command:

# $ bin/rails db:migrate

# The command will display output indicating that the table was created:

# ==  CreateArticles: migrating ===================================
# -- create_table(:articles)
#    -> 0.0018s
# ==  CreateArticles: migrated (0.0018s) ==========================


# Now we can interact with the table using our model.


class AddCategoryIdToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :category, 
    foreign_key: true
  end
end

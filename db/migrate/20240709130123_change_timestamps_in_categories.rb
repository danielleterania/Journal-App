class ChangeTimestampsInCategories < ActiveRecord::Migration[6.1]
  def change
    change_column_null :categories, :created_at, true
    change_column_null :categories, :updated_at, true
  end
end

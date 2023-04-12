class AddColumnCreatedByByToUser < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :users, :app_users, column: :created_by
  end
end

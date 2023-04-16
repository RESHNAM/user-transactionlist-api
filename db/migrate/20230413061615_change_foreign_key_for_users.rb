class ChangeForeignKeyForUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :created_by, :app_user_id
  end
end

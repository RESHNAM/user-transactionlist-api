class RenameColumnEmailToEmailAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column :app_users, :email, :email_address
  end
end

class AddColumnTotalToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :total, :decimal
  end
end

class AddUserIdIndexToProviders < ActiveRecord::Migration[5.2]
  def change
  	add_index :providers, :user_id
  end
end

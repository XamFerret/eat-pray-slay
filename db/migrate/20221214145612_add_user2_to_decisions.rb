class AddUser2ToDecisions < ActiveRecord::Migration[7.0]
  def change
    add_column :decisions, :user_2, :integer
  end
end

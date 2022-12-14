class AddLikes2ToDecisions < ActiveRecord::Migration[7.0]
  def change
    add_column :decisions, :likes2, :boolean
  end
end

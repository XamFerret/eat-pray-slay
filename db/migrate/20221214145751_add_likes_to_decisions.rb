class AddLikesToDecisions < ActiveRecord::Migration[7.0]
  def change
    add_column :decisions, :likes, :boolean
  end
end

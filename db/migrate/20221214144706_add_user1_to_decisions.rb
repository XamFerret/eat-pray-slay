class AddUser1ToDecisions < ActiveRecord::Migration[7.0]
  def change
    add_reference :decisions, :user, null: false, foreign_key: true
  end
end

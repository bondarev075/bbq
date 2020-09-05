class ChangeUserToNullInComments < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up   { change_column_null :comments, :user_id, true }
      dir.down { change_column_null :comments, :user_id, false }
    end
  end
end

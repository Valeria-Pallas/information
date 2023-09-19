class AddUserIdToCommentaires < ActiveRecord::Migration[7.0]
  def change
    add_column :commentaires, :user_id, :integer
  end
end

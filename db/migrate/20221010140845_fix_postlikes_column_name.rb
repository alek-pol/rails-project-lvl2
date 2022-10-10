class FixPostlikesColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_likes, :creator_id, :user_id
  end
end

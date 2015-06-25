class AddAuthorsToPosts < ActiveRecord::Migration
  def change
    add_column(:posts, :author_id, :integer)
            # table_name, column_name, column_type
  end
end

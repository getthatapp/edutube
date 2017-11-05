class AddTagListToLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :tag_list, :string
  end
end

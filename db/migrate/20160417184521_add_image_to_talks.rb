class AddImageToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :image_uid, :string
    add_column :talks, :image_name, :string
  end
end

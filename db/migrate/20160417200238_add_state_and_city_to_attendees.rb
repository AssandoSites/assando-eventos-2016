class AddStateAndCityToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :state, :string
    add_column :attendees, :city, :string
  end
end

class AddSpeakerToTalks < ActiveRecord::Migration
  def change
    add_reference :talks, :speaker, index: true, foreign_key: true
  end
end

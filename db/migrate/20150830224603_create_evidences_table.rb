class CreateEvidencesTable < ActiveRecord::Migration
  def change
    create_table :evidences do |t|
      t.integer :infraction_id
      t.string :media
    end
  end
end

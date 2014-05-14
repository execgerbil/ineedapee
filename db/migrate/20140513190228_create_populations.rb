class CreatePopulations < ActiveRecord::Migration
  def change
    create_table :populations do |t|
      t.references :person, index: true
      t.references :washroom, index: true

      t.timestamps
    end
  end
end

class CreateEndPoints < ActiveRecord::Migration
  def change
    create_table :end_points do |t|
      t.string :url
      t.text :body

      t.timestamps
    end
  end
end

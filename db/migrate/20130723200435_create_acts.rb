class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :title
      t.belongs_to :play
      t.timestamps
    end
  end
end

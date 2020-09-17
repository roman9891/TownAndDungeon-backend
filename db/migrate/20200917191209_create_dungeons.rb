class CreateDungeons < ActiveRecord::Migration[6.0]
  def change
    create_table :dungeons do |t|

      t.timestamps
    end
  end
end

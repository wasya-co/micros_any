# This migration comes from iro (originally 20231219204329)
class CreateDates < ActiveRecord::Migration[6.1]
  def change
    create_table :dates do |t|

      t.date :date

    end

    add_index :dates, :date, unique: true


  end
end

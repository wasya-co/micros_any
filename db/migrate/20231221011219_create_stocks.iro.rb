# This migration comes from iro (originally 20231220193201)
class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :iro_stocks do |t|

      t.string :ticker, null: false, index: true
      t.string :status, null: false, default: 'active', index: true

      t.timestamps
    end
  end
end

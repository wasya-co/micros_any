# This migration comes from iro (originally 20231220194903)
class AddAlertStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :iro_alerts, :status, :string, null: false, index: true, default: 'active'
  end
end

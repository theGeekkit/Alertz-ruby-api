class CreateSevereAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :severe_alerts do |t|

      t.timestamps
    end
  end
end

class CreateVoicemails < ActiveRecord::Migration
  def change
    create_table :voicemails do |t|

      t.timestamps
    end
  end
end

class AddUrlToVoicemail < ActiveRecord::Migration
  def change
    add_column :voicemails, :url, :string
  end
end

class ChangeMessageToTextType < ActiveRecord::Migration
  def up
    rename_column :histories, :message, :message_string
    add_column :histories, :message, :text

    ActiveRecord::Base.connection.execute("UPDATE histories SET message = message_string")

    remove_column :histories, :message_string
  end

  def down
    # don't do anything - we want this text forever and ever amen.
  end
end

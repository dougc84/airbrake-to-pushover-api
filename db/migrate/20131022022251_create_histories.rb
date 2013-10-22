class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :error_id # string because error_id can be quite large
      t.string :message
      t.string :error_class
      t.string :file
      t.integer :line_number
      t.string :project_id # string because project_id can be quite large
      t.string :project_name
      t.string :last_notice_id # string because last_notice_id can be quite large
      t.string :last_notice_request_url
      t.text :backtrace
      t.string :environment
      t.string :first_occurred_at
      t.string :last_occurred_at
      t.integer :times_occurred
      t.text :params
      t.string :sid # secure id for accessing via web

      t.timestamps
    end
    add_index :histories, :sid
  end
end

class CreateSms < ActiveRecord::Migration
  def up
    create_table :sms do |t|
      t.string :from
      t.string :to
      t.string :channel
      t.text :message

      t.timestamps null: false
    end
  end

  def down
    drop_table :sms
  end
end

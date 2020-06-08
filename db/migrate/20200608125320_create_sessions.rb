# frozen_string_literal: true

class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.belongs_to :mentor
      t.belongs_to :mentee
      t.datetime :date
      t.text :description
      t.string :status
      t.timestamps
    end
  end
end

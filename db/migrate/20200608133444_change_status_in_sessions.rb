# frozen_string_literal: true

class ChangeStatusInSessions < ActiveRecord::Migration[6.0]
  def change
    remove_column :sessions, :status
    add_column :sessions, :status, :integer, default: 0
  end
end

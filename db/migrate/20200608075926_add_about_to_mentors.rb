# frozen_string_literal: true

class AddAboutToMentors < ActiveRecord::Migration[6.0]
  def change
    add_column :mentors, :about, :string
  end
end

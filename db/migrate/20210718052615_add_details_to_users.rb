# frozen_string_literal: true

class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :profile, :string
  end
end

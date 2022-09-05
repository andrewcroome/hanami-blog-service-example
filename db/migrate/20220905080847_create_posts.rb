# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :posts do
      primary_key :id
      column :title, :text, null: false
      column :body, :text
      column :published_from, :timestamp, index: true
    end
  end
end

class AddSelfInfoToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :self_info, :boolean, :default => false
  end
end

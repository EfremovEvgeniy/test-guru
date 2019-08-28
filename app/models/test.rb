class Test < ApplicationRecord
  def self.all_by_category(category)
    categoty_id = Category.where('title = ?', category.capitalize!).pluck(:id)[0]
    where('categories_id = ?', categoty_id).order(id: :desc).pluck(:title)
  end
end

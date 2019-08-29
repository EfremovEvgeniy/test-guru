class Test < ApplicationRecord
  def self.all_by_category(category)
    joins('INNER JOIN categories ON tests.categories_id = categories.id')
      .where(categories: { title: category })
      .order(id: :desc)
      .pluck(:title)
  end
end

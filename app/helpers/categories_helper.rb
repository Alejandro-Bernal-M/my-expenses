module CategoriesHelper
  def total_amount(category)
    category.records.sum(:amount)
  end
end

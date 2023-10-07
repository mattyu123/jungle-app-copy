class Admin::CategoriesController < ApplicationController
  def show
    @categories_list = Category.all
  end
end

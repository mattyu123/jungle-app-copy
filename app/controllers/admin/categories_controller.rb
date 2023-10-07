class Admin::CategoriesController < ApplicationController
  def show
    @categories_list = Category.all
  end

  def new
    @category = Category.new
  end

  def create 
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'New Category Created!'
    else
      render :new
    end
  end
end

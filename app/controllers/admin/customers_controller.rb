class Admin::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def index
    @customers = Customer.all
  end
end

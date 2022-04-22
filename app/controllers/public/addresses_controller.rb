class Public::AddressesController < ApplicationController
  def index
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def create
    Address.new(address_params).save
    redirect_to request.referer
  end

  def destroy
    Address.find(params[:id]).destroy
    redirect_to request.referer
  end

  def edit
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def update
  end

  private
    def address_params
      params.require(:address).permit(:customer_id, :postal_code, :address, :name)
    end
end

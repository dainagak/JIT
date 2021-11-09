class Customers::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
      @customer = current_customer
  end

  def edit
      @customer = current_customer
  end

  def update
      @customer = current_customer
      if @customer.update(customer_params)
         flash[:success] = "Fixed"
         redirect_to action: :show
      else
          render 'edit'
      end
  end

  def unsubscribe
  end

  def withdraw
      @customer = current_customer
      @customer.update(is_active: true)
      reset_session

      flash[:notice] = "BYE"
      redirect_to root_path
  end

  private
      def customer_params
          params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number, :is_active)
      end

end

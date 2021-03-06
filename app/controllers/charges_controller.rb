class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    # Amount in cents
    @amount = 5000

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => '500 points',
      :currency    => 'usd'
    )

    current_user.points = current_user.points + 500
    current_user.save!

    flash[:event] = "added points"
    redirect_to user_account_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end

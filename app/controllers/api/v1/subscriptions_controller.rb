class Api::V1::SubscriptionsController < ApplicationController
  def index
    render json: SubscriptionSerializer.new(Subscription.all)
  end

  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: {errors: {details: "Subscription not created."}}, status: 404
    end
  end

  def destroy
    subscription = Subscription.find(params[:id])
    subscription.delete
    render json: subscription.delete, status: 204
  end

  private
    def subscription_params
      params.require(:subscription).permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
    end
end

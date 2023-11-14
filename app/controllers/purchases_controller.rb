class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
  end

  private

  def purchase_params
    params.permit(:purchase).merge(user_id: current_user.id)
  end

  def order
  end
end

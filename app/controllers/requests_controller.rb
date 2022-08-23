class RequestsController < ApplicationController
  skip_before_action: authorize_admin
  skip_before_action: authorize_manager, except: [:update]


  def create
    req = Request.create!(requests_params)
    render json: req, status: :created
  end

  def show
    req = Req.find_by(params[:id])
  end

  def destroy
    req = Request.find_by(params[:id])
    req.destroy
  end

  def update
    req = Request.find(params[:id])
    req.update(requests_params)
  end

  private
  def requets_params
    params.permit(:name, :category, :status, :urgency, :asset_id, :user_id, :quantity,)
  end
end

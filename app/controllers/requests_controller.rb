class RequestsController < ApplicationController
  skip_before_action: authorize_admin
  skip_before_action: authorize_manager, except: [:update]

  def index
    requests = Request.where(user_id: session[:user_id]).order("created_at DESC")
    render json: product, status: :ok
  end

  def create
    req = Request.create!(requests_params)
    render json: req, status: :created
  end

  def show
    req = find_req
    render json: req, status: :ok
  end

  def destroy
    req = find_req
    req.destroy
    head :no_content
  end

  def update
    req = Request.find(params[:id])
    req.update(requests_params)
  end

  private
  def find_req
    Request.find_by(id: params[:id])
  end
  def requets_params
    params.permit(:name, :category, :status, :urgency, :asset_id, :user_id)
  end
end

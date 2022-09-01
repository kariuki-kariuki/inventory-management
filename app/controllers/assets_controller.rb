class AssetsController < ApplicationController
  # skip_before_action :authorize
  def create
    new_asset = Asset.create!(asset_params)
    render json: new_asset, status: :created
  end

  def show
    asset = Asset.find_by(id: params[:id])
    render json: asset, status: :ok
  end

  def index
    if( @current_user.role == "Manager")
      render json: Asset.all, status: :ok
    else
      asset = Asset.where(status: false)
      render json: asset, status: :ok
    end
  end
  def my_assets
    assets = Asset.where(user_id: @current_user.id)
    # if(assets)
    render json: assets, status: :ok
  end

  def update
    if @current_user.role == "Manager"
      asset = find_asset
      asset.update!(asset_params)
      render json: asset, status: :updated
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end

  end


  def destroy 
    asset = find_asset(params[:id])
    asset.destroy
    head :no_content
  end
  private

  def find_asset
    Asset.find_by(id: params[:id])
  end

  def asset_params
    params.permit(:name, :amount, :user_id, :category, :status, :description)
  end
end

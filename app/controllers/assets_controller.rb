class AssetsController < ApplicationController
  # skip_before_action :authorize
  def create
    new_asset = Asset.create!(asset_params)
  
    ActionCable.server.broadcast("assets", new_asset )
    # render json: new_asset, status: :created
  end

  def show
    asset = Asset.find_by(id: params[:id])
    render json: asset, status: :ok
  end

  def index
    user = @current_user
    if(user[:role] == "Manager")
      render json: Asset.all, status: :ok
    else
      asset = Asset.where(user_id: session[:id])
      render json: asset, status: :ok
    end
  end


  def admin_assets_view
    assets = Asset.all
    render json: assets, status: :ok
  end



  def assets_without_users
    assets = Asset.where(user_id: nil)
    render json: assets, status: :ok
  end 

 

  def destroy 
    asset = find_asset(params[:id])
    asset.destroy
    head :no_content
  end


  private

  def find_asset(id)
    Asset.find_by(id: id)
  end

  def asset_params
    params.permit(:name, :category, :description)
  end
end

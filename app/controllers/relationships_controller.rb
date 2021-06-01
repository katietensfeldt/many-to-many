class RelationshipsController < ApplicationController
  def index
    if current_user
      render json: current_user.followers
    else
      render json: {}, status: :unauthorized
    end
  end

  def create
    if current_user
      relationship = Relationship.new(
        leader_id: current_user.id,
        follower_id: params[:follower_id]
      )
      if relationship.save
        render json: {message: "New friend added"}
      else
        render json: {errors: relationship.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    if current_user
      relationship = current_user.follower_relationships.find(params[:id])
      relationship.destroy
      render json: {message: "Relationship has been destroyed"}
    else
      render json: {}, status: :unauthorized
    end
  end
end

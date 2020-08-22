class RelationshipsController < ApplicationController
	def create
		current_user.follow(params[:id])
		redirect_to request.referer
	end

	def destroy
		current_user.unfollow(params[:id])
		redirect_to request.referer
	end

	def follow
		@user = User.find(params[:user_id])
		@users = @user.following_user
	end

	def follower
		@user = User.find(params[:user_id])
		@users = @user.follower_user
	end

end

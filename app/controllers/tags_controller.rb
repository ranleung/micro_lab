class TagsController < ApplicationController

	def index
		@tags = Tag.all
		respond_to do |format|
			format.html
			format.json { render json: @tags}
		end
	end

	def show
		tag_id = params[:id]
		@tags = Tag.find(tag_id)

	end

end

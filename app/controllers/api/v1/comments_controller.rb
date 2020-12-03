class Api::V1::CommentsController < ApplicationController
    skip_before_action :authorized, only: [:index]
    
    def index
        # entry = Entry.find(params[:entry_id])
        # comments = entry.comments
        comments = Comment.all

        render :json => CommentSerializer.new(comments)
    end
end

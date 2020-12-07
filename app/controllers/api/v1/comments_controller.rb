class Api::V1::CommentsController < ApplicationController
    skip_before_action :authorized, only: [:index]
    
    def index
        
        comments = Comment.all

        render :json => CommentSerializer.new(comments)
    end

    def create

        entry = Entry.find(params[:entry_id])
        #binding.pry
        comment = entry.comments.build(comment_params)
        
        #binding.pry
        if comment.valid?
            comment.save
            render :json => CommentSerializer.new(comment)
        else
            render :json => {errors: comment.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def update
        
        comment = Comment.find(params[:id])
        #binding.pry
        if comment.user == current_user && comment.update(comment_params)
            #binding.pry
            render :json => CommentSerializer.new(comment), status: :accepted
        else
            #binding.pry
            render :json => {errors: 'Invalid update', status: :unprocessible_entity}
            
        end
    end

    def destroy
        #binding.pry
        comment = Comment.find(params[:id])
        
        if current_user == comment.user && comment.destroy
            render :json => CommentSerializer.new(comment), status: :accepted
        else 
            render :json => {errors: 'Invalid deletion', status: :unprocessible_entity }
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :entry_id)
    end
end

class Api::V1::LikesController < ApplicationController

    def create
        entry = Entry.find(params[:entry_id])

        like = entry.likes.build(like_params)

        if like.valid?
            entry.save
            render :json => LikeSerializer.new(like), status: :accepted
        else
            #error message
            render :json => {errors: like.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def update
        entry = Entry.find(params[:entry_id])
        like = Like.find(params[:id])
        

        if like.update(like_params)
            like.save
            render :json => {like: LikeSerializer.new(like), entry: EntrySerializer.new(entry)}, status: :accepted
        else
            #error message
            render :json => {errors: like.errors.full_messages}, status: :unprocessible_entity
        end
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :entry_id, :liked)
    end
end

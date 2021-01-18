class Api::V1::EntriesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        #user = User.find(params[:user_id])
        if params[:user_id]
            # binding.pry
            if params[:user_id] == current_user.id.to_s
                entries = User.find(params[:user_id]).entries.order(updated_at: :desc).where("blog_id IS NULL")
            else
                entries = User.find(params[:user_id]).entries.order(updated_at: :desc).where("public = true")
            end
            
        else 
            entries = Entry.all.order(updated_at: :desc).where(public: true).where("blog_id IS NULL")
        end

        options = {
            include: [:comments, :likes]
        }
        render :json => EntrySerializer.new(entries, options)
    end

    def show

        # binding.pry
        entry = Entry.find_by_id(params[:id])
        
        #passages = entry.passages
        if !entry.blank? && entry.public
            options = {
            include: [:comments, :likes]
                # :passages => {:only => [:content, :book, :chapter, :verse]},
                # :comments => {:only => [:'comments.content', :'comments.user.name']}
                
            }
            render json: EntrySerializer.new(entry, options)
        else
            render :json => {errors: 'Record not found'}, status: :unprocessable_entity
        end
        
    end

    def create
        #binding.pry
        entry = Entry.new(entry_params)
        #binding.pry
        #entry.likes.build(user_id: entry_params.user_id)
        #binding.pry
        if entry.valid?
            entry.save
            render :json => EntrySerializer.new(entry), status: :accepted
        else
            #error message
            render :json => {errors: entry.errors.full_messages.to_sentence}, status: :unprocessable_entity
        end
    end

    def update
        
        entry = Entry.find(params[:id])
        #binding.pry
        if entry.user == current_user && entry.update(entry_params)
            #binding.pry
            render :json => EntrySerializer.new(entry), status: :accepted
        else
            #binding.pry
            render :json => {errors: 'Invalid update', status: :unprocessible_entity}
            
        end
    end

    def destroy
        #binding.pry
        entry = Entry.find(params[:id])
        

        if current_user == entry.user && entry.destroy
            render :json => EntrySerializer.new(entry), status: :accepted
        else 
            render :json => {errors: 'Invalid deletion', status: :unprocessible_entity }
        end
    end

    private

    def entry_params
        params.require(:entry).permit(:content, :user_id, :public, :blog_id, :text_content, :published)
    end
end

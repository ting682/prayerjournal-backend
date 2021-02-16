class Api::V1::BlogsController < ApplicationController

    skip_before_action :authorized, only: [:index, :show]

    def index
        # binding.pry
        #user = User.find(params[:user_id])
        # if params[:user_id]
        #     # binding.pry
        #     if params[:user_id] == current_user.id.to_s
        #         blogs = User.find(params[:user_id]).blogs.order(updated_at: :desc)
        #     else
        #         blogs = User.find(params[:user_id]).blogs.order(updated_at: :desc).where("public = true")
        #     end
            
        # else 
        if current_user
            blogs = Blog.all.order(updated_at: :desc).where(user_id: current_user.id).or(Blog.all.order(updated_at: :desc).where("published = true"))
        else
            blogs = Blog.all.order(updated_at: :desc).where("published = true")
        end

        options = {
            include: [:entries]
        }
        render :json => BlogSerializer.new(blogs, options)
    end

    def show

        # binding.pry
        blog = Blog.find_by_id(params[:id])
        
        #passages = blog.passages
        if !blog.blank? && blog.published
            options = {
            include: [:entries]
                # :passages => {:only => [:content, :book, :chapter, :verse]},
                # :comments => {:only => [:'comments.content', :'comments.user.name']}
                
            }
            render json: BlogSerializer.new(blog, options)
        elsif !blog.blank? && current_user.admin
            options = {
            include: [:entries]
                # :passages => {:only => [:content, :book, :chapter, :verse]},
                # :comments => {:only => [:'comments.content', :'comments.user.name']}
                
            }
            render json: BlogSerializer.new(blog, options)
        else
            render :json => {errors: 'Record not found'}, status: :unprocessable_entity
        end
        
    end

    def create
        #binding.pry
        blog = Blog.new(blog_params)
        #binding.pry
        #blog.likes.build(user_id: blog_params.user_id)
        #binding.pry
        if blog.valid?
            blog.save
            render :json => BlogSerializer.new(blog), status: :accepted
        else
            #error message
            render :json => {errors: blog.errors.full_messages.to_sentence}, status: :unprocessable_entity
        end
    end

    def update
       
        blog = Blog.find(params[:id])
        # binding.pry
        if blog.user == current_user && blog.update(blog_params)
            #binding.pry
            render :json => BlogSerializer.new(blog), status: :accepted
        else
            #binding.pry
            render :json => {errors: 'Invalid update', status: :unprocessible_entity}
            
        end
    end

    def destroy
        #binding.pry
        blog = Blog.find(params[:id])
        

        if current_user == blog.user && blog.destroy
            render :json => BlogSerializer.new(blog), status: :accepted
        else 
            render :json => {errors: 'Invalid deletion', status: :unprocessible_entity }
        end
    end

    private

    def blog_params
        params.require(:blog).permit(:title, :description, :image_url, :video_url, :user_id, :public, :published)
    end
end

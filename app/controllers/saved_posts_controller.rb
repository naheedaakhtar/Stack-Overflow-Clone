class SavedPostsController < ApplicationController
    before_action :authenticate_user!

    def create
        post=Post.find(params[:post_id])
        saved_post= current_user.saved_posts.build(post: post)
        if saved_post.save
            flash[:success]="Post Saved Successfully"
        else
            flash[:error]="Post Already Saved"
        end
        redirect_to post_path(post)
    end

    def destroy
        post=Post.find(params[:post_id])
        saved_post=current_user.saved_posts_records.find_by(id: post.id)
        if saved_post && current_user.saved_posts_records.delete(post)
            flash[:success]="Post Unsaved"
        else
            flash[:alert]="Failed to Unsave Post"
        end
        redirect_to post_path(post)
    end     
end

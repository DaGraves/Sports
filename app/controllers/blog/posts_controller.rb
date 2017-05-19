module Blog
  class PostsController < BlogController

    impressionist
    # GET /posts
    # GET /posts.json
    def index
      if params[:tag]
      @posts = Post.most_recent.published.paginate(:page => params[:page], per_page: 6).tagged_with(params[:tag])
      else
      @posts = Post.most_recent.published.paginate(:page => params[:page], per_page: 6)
      end
    end

    # GET /posts/1
    # GET /posts/1.json
    def show
      @post = storage.friendly.find(params[:id])
      @posts = Post.most_recent.limit(2)
    end

    private

    def storage
      Post.published
    end

  end

end

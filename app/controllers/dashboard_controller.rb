class DashboardController < ApplicationController
  def overview
    @scheduled_posts = Post.scheduled
    @post_drafts = Post.draft
    # keep code below for when I build better authorization
    # authorize @scheduled_posts
    # authorize @post_drafts
  end
end

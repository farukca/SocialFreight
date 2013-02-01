json.(@comment, :id, :comment_text, :commentable_type, :commentable_id)
json.commentable_path polymorphic_path(@comment.commentable)
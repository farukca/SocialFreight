json.(@comment, :id, :comment_text)
json.commentable_path polymorphic_path(@comment.commentable)
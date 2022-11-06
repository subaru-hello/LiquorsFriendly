# frozen_string_literal: true

class CommentCell < Cell::ViewModel
  property :body
  property :commenter
  def show
    render
  end
end

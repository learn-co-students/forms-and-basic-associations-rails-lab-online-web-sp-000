class Note < ActiveRecord::Base
  belongs_to :song

  private

  def post_params
    params.require(:post).permit(:content)
  end
end

class User
  attr_accessor :follows, :followed_by, :next_cursor

  def initialize(next_cursor=nil)
    @follows = []
    @followed_by = []

    if (@follows.count == 0)
      followers = Instagram.user_follows(:count => 7, :cursor => next_cursor)
      if followers.class == Array && followers.length == 2
        render :text => "Instagram have blocked us"
      else
        followers.each do |user|
          @follows << Instagram.user(user.id) if user && user.id
        end
      end
    end

    if (@followed_by.count == 0)
      @followed_by = Instagram.user_followed_by
    end

    @next_cursor = followers.pagination.next_cursor
    # p "PLEAES"
    # p followers
    # s.follows[0].counts[:media] < 10
  end
end

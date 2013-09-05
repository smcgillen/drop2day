class User
  attr_accessor :follows, :followed_by

  def initialize(cursor=nil)
    @follows = []
    @followed_by = []
    @cursor = -1

    if (@follows.count == 0)
      followers = Instagram.user_follows(:count => 20, :cursor => @cursor)
      followers.each do |user|
        @follows << Instagram.user(user.id)
      end
      @cursor = followers.next_cursor
    end

    if (@followed_by.count == 0)
      @followed_by = Instagram.user_followed_by
    end

    # s.follows[0].counts[:media] < 10
  end

end

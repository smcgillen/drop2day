class User
  attr_accessor :follows, :followed_by

  def initialize
    @follows = []
    @followed_by = []

    if (@follows.count == 0)
      Instagram.user_follows(:count => 20).each do |user|
        @follows << Instagram.user(user.id)
      end
    end

    if (@followed_by.count == 0)
      @followed_by = Instagram.user_followed_by
    end

    # s.follows[0].counts[:media] < 10
  end

end

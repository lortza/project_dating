class ProfileMatcher

  def initialize(user)
    @user = user
    @matches = {}
  end

  def find_matches
    User.all.each do |u|
      @matches[u.id] = 0 unless @matches[u.id]

        if u.beer == @user.beer && u != @user
          @matches[u.id] += 1
        end
        if u.cat == @user.cat && u != @user
          @matches[u.id] += 1
        end
        if u.color == @user.color && u != @user
          @matches[u.id] += 1
        end
        if u.food == @user.food && u != @user
          @matches[u.id] += 1
        end
    end #each
      @matches = @matches.select {|_k, v| v > 0}
      @matches = User.where('id IN (?)', @matches.keys)
  end #pusher

  def beer
    User.all.select do |u|
      u.beer == @user.beer && u != @user
    end
  end

  def cat
    User.all.select do |u|
      u.cat == @user.cat && u != @user
    end
  end

  def color
    User.all.select do |u|
      u.color == @user.color && u != @user
    end
  end

  def food
    User.all.select do |u|
      u.food == @user.food && u != @user
    end
  end

end

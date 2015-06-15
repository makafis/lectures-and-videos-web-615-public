module Rankable
  module InstanceMethods
    def top_5
      # is to return the top 5 artists by rank
      (self.songs.sort_by do |object|
        object.rank
      end).first(5)
    end
  end

  module ClassMethods
    def top_5
      (self.all.sort_by do |object|
        object.rank
      end).first(5)
    end

    def reset
      self.all.clear
    end
  end
end


require_relative 'node.rb'
class Graph
  def initialize
    @checked_actors = []
  end

  def bfs(node, kevin_bacon)
    return "try again" if node == kevin_bacon

    queue = []
    queue << node
    @checked_actors << node
    arr = []

    while queue.any?

      current_node = queue.shift
      current_node.film_actor_hash.each do |film, cast_list|
        if cast_list.include?(kevin_bacon)
          arr << film
          arr.uniq!
          if arr.length > 7
            return "Kevin Bacon is more than 6 connections away."
          end
          return arr
        else
          cast_list.each do |actor|
            next if @checked_actors.include?(actor) || queue.include?(actor)
            queue << actor
            @checked_actors << actor
              arr << film
          end
        end
      end
    end
    "Kevin Bacon not found."
  end
end

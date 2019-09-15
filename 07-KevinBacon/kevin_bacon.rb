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
    #create some array in the while loop that adds films that are the

    #path through each iteration instead of calling contruct path

    while queue.any?

      current_node = queue.shift
      current_node.film_actor_hash.each do |film, cast_list|
        if cast_list.include?(kevin_bacon)
          #might want to compare strings instead of objects
          #make sure we arent adding the same film multiple times
          return arr
        else
          cast_list.each do |actor|
            next if @checked_actors.include?(actor) || queue.include?(actor)
            queue << actor
            @checked_actors << actor
            if cast_list.include?(actor)
              arr << film
              arr.uniq!
            end
          end
        end
      end
    end
    "Kevin Bacon not found."
  end
  # if arr.size > 6, stop
end

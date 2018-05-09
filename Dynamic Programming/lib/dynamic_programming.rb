class DynamicProgramming

  def initialize
    @blair_cache = {}
    @frog_cache = []
    @knap_cache = {}
  end

  # # Top-Down
  # def blair_nums(n)
  #   return 1 if n == 1
  #   return 2 if n == 2

  #   odd = ((n - 1) * 2) - 1
  #   @blair_cache[n - 1] = blair_nums(n - 1) unless @blair_cache[n - 1]
  #   @blair_cache[n - 2] = blair_nums(n - 2) unless @blair_cache[n - 2]
  #   @blair_cache[n] = @blair_cache[n - 1] + @blair_cache[n - 2] + odd

  #   @blair_cache[n]
  # end

  # Bottom-Up
  def blair_nums(n)
    local_cache = build_blair_cache(n)
    local_cache[n]
  end

  def build_blair_cache(n)
    cache = {} 
    cache[1] = 1
    cache[2] = 2
    3.upto(n) do |num|
      odd = ((num - 1) * 2) - 1
      cache[num] = cache[num - 1] + cache[num - 2] + odd
    end

    cache
  end

  def frog_hops_bottom_up(n)

  end

  def frog_cache_builder(n)

  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end

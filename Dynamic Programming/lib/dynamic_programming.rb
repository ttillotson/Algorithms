require 'byebug'
class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    @frog_cache = { 1 => [[1]], 
                    2 => [[1, 1], [2]], 
                    3 => [[1, 1, 1], [1, 2], [2, 1], [3]] }
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
    local_cache = frog_cache_builder(n)
    local_cache[n]
  end

  def frog_cache_builder(n)
    cache = { 1 => [[1]], 
              2 => [[1, 1], [2]], 
              3 => [[1, 1, 1], [1, 2], [2, 1], [3]] }
    return cache if n < 4

    4.upto(n) do |num|
      p1 = cache[num - 1].map { |el| el + [1] }
      p2 = cache[num - 2].map { |el| el + [2] }
      p3 = cache[num - 3].map { |el| el + [3] }
      cache[num] = p1 + p2 + p3
    end

    cache
  end
  # cache[1] [1]
  # cache[2] [11][2]
  # cache[3] [111][12][21][3]
  # cache[4 - 3].map { |el| el + [1] } [31]
  # cache[4 - 2].map { |el| el + [2] } [112][22]
  # cache[4 - 1].map { |el| el + [3] } [1111][121][211][13]
  # cache[4] [1111][112][121][211][22][13][31]
  # cache[5] [11111][1112][1121][1211][2111][113][131][311][122][212][221][23][32]

  def frog_hops_top_down(n)
    hops = frog_hops_top_down_helper(n)
    @frog_cache[n]
  end

  def frog_hops_top_down_helper(n)
    @frog_cache[1] = [[1]]
    @frog_cache[2] = [[1, 1], [2]]
    @frog_cache[3] = [[1, 1, 1], [1, 2], [2, 1], [3]]
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

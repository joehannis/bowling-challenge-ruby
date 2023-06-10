class Frames
  def initialize
    @frames = [
      {1 => 0, 2 => 0}, # frame 1
      {1 => 0, 2 => 0}, # frame 2
      {1 => 0, 2 => 0}, # frame 3
      {1 => 0, 2 => 0}, # frame 4
      {1 => 0, 2 => 0}, # frame 5
      {1 => 0, 2 => 0}, # frame 6
      {1 => 0, 2 => 0}, # frame 7
      {1 => 0, 2 => 0}, # frame 8
      {1 => 0, 2 => 0}, # frame 9
      {1 => 0, 2 => 0}  # frame 10
    ]
  end
  def frame_no(n)
    return @frames[n-1]
  end
end

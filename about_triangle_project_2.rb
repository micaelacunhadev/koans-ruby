require File.expand_path(File.dirname(__FILE__) + '/neo')

# You need to write the triangle method in the file 'triangle.rb'
require './triangle.rb'

class AboutTriangleProject2 < Neo::Koan

  class TriangleError < RuntimeError
  end

  def triangle( side1, side2, side3)

    # put the arguments into an array
    side_arr = [side1, side2, side3]
    # sort the array
    side_arr.sort!

    # if there are sizes equal or less than 0, raise an error
    if side_arr.first <= 0
      raise TriangleError
    end

    # The sum of the lengths of any two sides of the triangle is always greater than the length of the third side.
    # if this is not verifies, raise an error
    if side_arr.first + side_arr[1] <= side_arr.last || side.arr[1] + side_arr.last <= side_arr.first
      raise TriangleError
    end

    # if all sides are the same size, then it is an equilateral triangle
    if side1 == side2 && side2 == side3
      return :equilateral

    # if all the sides have different sizes
    elsif side_arr[1] != side_arr.first && side_arr[1] != side_arr.last
      return :scalene

    # otherwise, it is an isosceles triangle
    else
      return :isosceles
    end
  end

  # The first assignment did not talk about how to handle errors.
  # Let's handle that part now.
  def test_illegal_triangles_throw_exceptions
    assert_raise(TriangleError) do triangle(0, 0, 0) end
    assert_raise(TriangleError) do triangle(3, 4, -5) end
    assert_raise(TriangleError) do triangle(1, 1, 3) end
    assert_raise(TriangleError) do triangle(2, 4, 2) end
    # HINT: for tips, see http://stackoverflow.com/questions/3834203/ruby-koan-151-raising-exceptions
  end
end

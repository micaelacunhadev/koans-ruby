require File.expand_path(File.dirname(__FILE__) + '/neo')

# You need to write the triangle method in the file 'triangle.rb'
require './triangle'

class AboutTriangleProject < Neo::Koan

  def triangle( side1, side2, side3)
    # if all sides are the same size, then it is an equilateral triangle
    if side1 == side2 && side2 == side3
      return :equilateral
    # otherwise, test the other two cases
    else 
      # put the arguments into an array
      side_arr = [side1, side2, side3]
      # sort the array
      side_arr.sort!

      # if all the sides have different sizes, then it is a scalene triangle
      if side_arr[1] != side_arr.first && side_arr[1] != side_arr.last
        return :scalene
      # otherwise, it is an isosceles triangle
      else
        return :isosceles
      end
    end
  end
  
  
  def test_equilateral_triangles_have_equal_sides
    assert_equal :equilateral, triangle(2, 2, 2)
    assert_equal :equilateral, triangle(10, 10, 10)
  end

  def test_isosceles_triangles_have_exactly_two_sides_equal
    assert_equal :isosceles, triangle(3, 4, 4)
    assert_equal :isosceles, triangle(4, 3, 4)
    assert_equal :isosceles, triangle(4, 4, 3)
    assert_equal :isosceles, triangle(10, 10, 2)
  end

  def test_scalene_triangles_have_no_equal_sides
    assert_equal :scalene, triangle(3, 4, 5)
    assert_equal :scalene, triangle(10, 11, 12)
    assert_equal :scalene, triangle(5, 4, 2)
  end
end

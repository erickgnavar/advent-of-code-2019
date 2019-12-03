defmodule AdventOfCode.Day01Test do
  use ExUnit.Case
  import AdventOfCode.Day01

  test "calculate_fuel/1 examples" do
    cases = [
      {12, 2},
      {14, 2},
      {1969, 654},
      {100_756, 33583}
    ]

    Enum.each(cases, fn {input, output} ->
      assert calculate_fuel(input) == output
    end)
  end

  test "read and calculate the total fuel" do
    calculate_total_fuel()
  end

  test "calculate_fuel_accumulate/1 examples" do
    cases = [
      {14, 2},
      {1969, 966},
      {100_756, 50346}
    ]

    Enum.each(cases, fn {input, output} ->
      assert calculate_fuel_accumulate(input) == output
    end)
  end

  test "read and calculate the total fuel accumulated" do
    calculate_total_fuel_accumulate()
  end
end

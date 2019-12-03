defmodule AdventOfCode.Day02Test do
  use ExUnit.Case
  import AdventOfCode.Day02

  test "run_intcode/1 examples" do
    cases = [
      {"1,0,0,0,99", "2,0,0,0,99"},
      {"2,3,0,3,99", "2,3,0,6,99"},
      {"2,4,4,5,99,0", "2,4,4,5,99,9801"},
      {"1,1,1,4,99,5,6,0,99 ", "30,1,1,4,2,5,6,0,99"}
    ]

    Enum.each(cases, fn {input, output} ->
      assert run_intcode(input) == output
    end)

    step1() |> IO.inspect()
    step2() |> IO.inspect()
  end
end

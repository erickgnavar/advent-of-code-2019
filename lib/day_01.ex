defmodule AdventOfCode.Day01 do
  def calculate_fuel(mass) do
    mass
    |> Kernel./(3)
    |> Float.floor()
    |> Kernel.-(2)
  end

  def calculate_fuel_accumulate(mass) do
    do_calculate_fuel_accumulate(mass, 0)
  end

  defp do_calculate_fuel_accumulate(mass, acc) when mass <= 0, do: acc

  defp do_calculate_fuel_accumulate(mass, acc) do
    fuel = calculate_fuel(mass)

    if fuel <= 0 do
      do_calculate_fuel_accumulate(fuel, acc)
    else
      do_calculate_fuel_accumulate(fuel, acc + fuel)
    end
  end

  def calculate_total_fuel() do
    read_and_process(&calculate_fuel/1)
  end

  def calculate_total_fuel_accumulate() do
    read_and_process(&calculate_fuel_accumulate/1)
  end

  defp read_and_process(fun) do
    File.stream!("inputs/day01.txt")
    |> Stream.map(fn line ->
      {number, _} = Integer.parse(line)
      number
    end)
    |> Stream.map(fun)
    |> Enum.reduce(0, &(&1 + &2))
  end
end

defmodule AdventOfCode.Day02 do
  def run_intcode(input) do
    input
    |> String.trim()
    |> String.split(",")
    |> Enum.map(fn value ->
      {number, _} = Integer.parse(value)
      number
    end)
    |> process(0)
    |> Enum.join(",")
  end

  defp process(data, current_position) do
    case Enum.at(data, current_position) do
      1 ->
        value1 = Enum.at(data, Enum.at(data, current_position + 1))
        value2 = Enum.at(data, Enum.at(data, current_position + 2))
        result_position = Enum.at(data, current_position + 3)
        updated_data = List.update_at(data, result_position, fn _ -> value1 + value2 end)
        process(updated_data, current_position + 4)

      2 ->
        value1 = Enum.at(data, Enum.at(data, current_position + 1))
        value2 = Enum.at(data, Enum.at(data, current_position + 2))
        result_position = Enum.at(data, current_position + 3)
        updated_data = List.update_at(data, result_position, fn _ -> value1 * value2 end)
        process(updated_data, current_position + 4)

      99 ->
        data
    end
  end

  def replace_inputs(input, noun, verb) do
    input
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, fn _ -> noun end)
    |> List.update_at(2, fn _ -> verb end)
    |> Enum.join(",")
  end

  def read_file() do
    File.open!("inputs/day02.txt", [:read, :utf8], fn file ->
      content = IO.read(file, :all)
      String.replace(content, "\n", "")
    end)
  end

  def step1() do
    read_file()
    |> replace_inputs(12, 2)
    |> run_intcode()
  end

  def step2() do
    original_content = read_file()
    range = Enum.to_list(0..99)
    possible_inputs = for i <- range, j <- range, do: {i, j}
    expected_result = "19690720"

    possible_inputs
    |> Enum.map(fn {a, b} ->
      {a, b, guess_inputs(original_content, a, b, expected_result)}
    end)
    |> Enum.filter(fn {_, _, result} -> result end)
    |> List.first()
  end

  def guess_inputs(content, noun, verb, expected_result) do
    content
    |> replace_inputs(noun, verb)
    |> run_intcode()
    |> String.split(",")
    |> Enum.at(0)
    |> Kernel.==(expected_result)
  end
end

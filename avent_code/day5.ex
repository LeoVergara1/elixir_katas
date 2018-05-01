
defmodule AdventOfCode.Day5 do
  def is_nice_string(line) do
    is_nice = false
    number_vowel = numer_vowels(line) 
    double_letter = double_letters(line)
    not_strings = not_string(line)
    case {number_vowel, double_letter, not_strings} do
      {true, true, false} -> 
        is_nice = true
      _ -> 
        is_nice
    end
  end

  def numer_vowels(line) do
    size = 
    ~r/[aeiou]/ 
    |> Regex.scan(line)
    |> List.flatten
    |> length
    cond do
      size > 2 -> true
      true ->
        "Nothing"
    end 
  end

  def double_letters(line) do
    ~r/(.)\1+/
    |> Regex.match?(line)
  end

  def not_string(line) do
    ~r/((ab)|(cd)|(pq)|(xy))/
    |> Regex.match?(line)
  end

  def counter do
    counterN = 0
    Enum.each [1,2,3], fn e ->
      counterN  = counterN + 1
    end
    counterN
  end
end

alias AdventOfCode.Day5

{:ok, file} = File.read("day5.txt")

lines = String.split file, "\n"

counter = Enum.count lines, fn line -> 
  true == Day5.is_nice_string(line)
end

IO.puts counter
  
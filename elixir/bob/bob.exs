defmodule Bob do
  def hey(input) do
    cond do
      empty?(input)    -> "Fine. Be that way!"
      asking?(input)   -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true             -> "Whatever."
    end
  end

  defp empty?(input) do
    input |> String.strip |> String.length == 0
  end

  defp asking?(input) do
    input |> String.ends_with?("?")
  end

  defp shouting?(input) do
    input == String.upcase(input) && input != String.downcase(input)
  end
end

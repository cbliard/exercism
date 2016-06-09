defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t) :: String.t()
  def abbreviate(string) do
    string
      |> get_leading_and_uppercase_letters
      |> Enum.join
      |> String.upcase
  end

  def get_leading_and_uppercase_letters(string) do
    Regex.scan(~r/\b\p{L}|\p{Lu}/, string)
  end
end

defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  def encode("") do
    ""
  end

  @spec encode(String.t) :: String.t
  def encode(string) do
    << head::utf8, tail::binary >> = string
    encode(head, 1, tail, "")
  end

  def encode(letter, count, "", acc) do
    acc <> "#{count}#{<<letter>>}"
  end

  def encode(letter, count, string, acc) do
    << head::utf8, tail::binary >> = string
    cond do
      letter == head -> encode(letter, count + 1, tail, acc)
      true           -> encode(head, 1, tail, encode(letter, count, "", acc))
    end
  end

  @spec decode(String.t) :: String.t
  def decode(string) do

  end
end

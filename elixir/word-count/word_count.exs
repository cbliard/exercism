defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
      |> String.split(~r/[^[:alnum:]-]+/u, trim: true)
      |> Enum.map(&String.downcase/1)
      |> Enum.reduce(%{}, &increment_word_count/2)
  end

  def increment_word_count(word, counts) do
    Map.put(counts, word, Map.get(counts, word, 0) + 1)
  end
end

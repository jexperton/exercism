defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    String.downcase(sentence)
    |> String.replace(~r/[^[:alnum:]\s-_]/ui, "")
    |> String.split(~r/[_\s]+/)
    |> Enum.reduce(%{}, fn word, acc ->
        Map.update(acc, word, 1, &(&1 + 1))
      end)
  end
end

defmodule December4_1 do
    def read_file(file_path) do
        case File.read(file_path) do
            {:ok, content} ->
                content
            {:error, reason} ->
                IO.puts("Error reading file: #{reason}")
                ""
        end
    end

    def count_neighbors(lines, indexY, indexX) do
        rollCount = 0

        rollCount = if indexY - 1 >= 0 do
            splitAboveLine = String.split(Enum.at(lines, indexY-1), "", trim: true)
            count = 0

            count = if indexX - 1 >= 0 and Enum.at(splitAboveLine, indexX-1) == "@", do: count + 1, else: count
            count = if indexX + 1 < length(splitAboveLine) and Enum.at(splitAboveLine, indexX+1) == "@", do: count + 1, else: count
            count = if Enum.at(splitAboveLine, indexX) == "@", do: count + 1, else: count

            rollCount + count
        else
            rollCount
        end

        rollCount = if indexY + 1 < length(lines) do
            splitUnderLine = String.split(Enum.at(lines, indexY+1), "", trim: true)
            count = 0

            count = if indexX - 1 >= 0 and Enum.at(splitUnderLine, indexX-1) == "@", do: count + 1, else: count
            count = if indexX + 1 < length(splitUnderLine) and Enum.at(splitUnderLine, indexX+1) == "@", do: count + 1, else: count
            count = if Enum.at(splitUnderLine, indexX) == "@", do: count + 1, else: count

            rollCount + count
        else
            rollCount
        end

        rollCount
    end

    def count_side_neighbors(chars, indexX) do
        count = 0
        count = if indexX - 1 >= 0 and Enum.at(chars, indexX-1) == "@", do: count + 1, else: count
        count = if indexX + 1 < length(chars) and Enum.at(chars, indexX+1) == "@", do: count + 1, else: count
        count
    end

    def main do
        file_path = "input.txt"
        content = read_file(file_path)
        lines = String.split(content, "\n", trim: true)

        forkliftAccess =
            lines
            |> Enum.with_index()
            |> Enum.reduce(0, fn {line, indexY}, acc_y ->
                chars = String.split(line, "", trim: true)

                chars
                |> Enum.with_index()
                |> Enum.reduce(acc_y, fn {char, indexX}, acc_x ->
                    if char == "@" do
                        rollCount = count_neighbors(lines, indexY, indexX) + count_side_neighbors(chars, indexX)
                        if rollCount < 4 do
                            acc_x + 1
                        else
                            acc_x
                        end
                    else
                        acc_x
                    end
                end)
            end)

        IO.puts(forkliftAccess)
    end
end

December4_1.main()

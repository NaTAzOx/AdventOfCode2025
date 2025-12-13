fun readFile(filePath: String): String {
    val file = java.io.File(filePath)
    if (!file.exists()) {
        println("File does not exist.")
        return ""
    }

    val content = file.readText()
    return content
}

private fun countZeroPassesRight(start: Int, clicks: Int): Int {
    if (clicks <= 0) {
        return 0
    }
    val first = (100 - start) % 100
    val firstPositive = if (first == 0) 100 else first
    if (clicks < firstPositive) {
        return 0
    }
    return 1 + (clicks - firstPositive) / 100
}

private fun countZeroPassesLeft(start: Int, clicks: Int): Int {
    if (clicks <= 0) {
        return 0
    }
    val firstPositive = if (start == 0) 100 else start
    if (clicks < firstPositive) {
        return 0
    }
    return 1 + (clicks - firstPositive) / 100
}

fun main(args: Array<String>) {
    if (args.isEmpty()) {
        println("Please provide a file path.")
        return
    }
    val lines = readFile(args[0]).lineSequence().filter { it.isNotBlank() }
    var dialPoint = 50
    var amountOfZeros = 0
    for (line in lines) {
        val rotation = line[0]
        val clicks = line.substring(1).toInt()
        when (rotation) {
            'L' -> {
                amountOfZeros += countZeroPassesLeft(dialPoint, clicks)
                dialPoint = (dialPoint - clicks) % 100
                if (dialPoint < 0) {
                    dialPoint += 100
                }
            }
            'R' -> {
                amountOfZeros += countZeroPassesRight(dialPoint, clicks)
                dialPoint = (dialPoint + clicks) % 100
            }
        }
    }

    println(amountOfZeros)
}
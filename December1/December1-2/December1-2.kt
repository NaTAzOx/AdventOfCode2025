fun readFile(filePath: String): String {
    val file = java.io.File(filePath)
    if (!file.exists()) {
        println("File does not exist.")
        return ""
    }

    val content = file.readText()
    return content
}

fun main(args: Array<String>) {
    if (args.isEmpty()) {
        println("Please provide a file path.")
        return
    }
    val lines = readFile(args[0]).lines()
    var dialPoint = 50
    var amountOfZeros = 0
    for (line in lines) {
        val rotation = line[0]
        val clicks = line.substring(1).toInt()
        when (rotation) {
            'L' -> {
                dialPoint = dialPoint - clicks

                while (dialPoint < 0) {
                    dialPoint += 100
                    amountOfZeros++
                }

                println(dialPoint)
            }
            'R' -> {
                dialPoint = dialPoint + clicks

                while (dialPoint > 99) {
                    dialPoint -= 100
                    amountOfZeros++
                }

                println(dialPoint)
            }
        }
    }

    println(amountOfZeros)
}
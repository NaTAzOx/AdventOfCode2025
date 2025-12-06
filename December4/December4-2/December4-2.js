import { readFileSync } from 'fs';

function readFile() {
    const input = readFileSync("input.txt", 'utf8').trim();

    return input;
}

let content = readFile()

function removeRoll(map) {
    let rollDeleted = 0
    let lines = map.split("\n")
    let updatedLines = lines.map(line => line.split(""))
    let toDelete = []

    for (let indexY = 0; indexY < lines.length; indexY++) {
        let chars = updatedLines[indexY]
        for (let indexX = 0; indexX < chars.length; indexX++) {
            let char = chars[indexX]
            let rollCount = 0
            if (char === "@") {
                if (indexY - 1 >= 0) {
                    let splitAboveLine = updatedLines[indexY-1]
                    if (indexX - 1 >= 0) {
                        let character = splitAboveLine[indexX-1]
                        if (character === "@") {
                            rollCount++
                        }
                    }

                    if (indexX + 1 < splitAboveLine.length) {
                        let character = splitAboveLine[indexX+1]
                        if (character === "@") {
                            rollCount++
                        }
                    }

                    let character = splitAboveLine[indexX]
                    if (character === "@") {
                        rollCount++
                    }
                }

                if (indexY + 1 < lines.length) {
                    let splitUnderLine = updatedLines[indexY+1]
                    if (indexX - 1 >= 0) {
                        let character = splitUnderLine[indexX-1]
                        if (character === "@") {
                            rollCount++
                        }
                    }

                    if (indexX + 1 < splitUnderLine.length) {
                        let character = splitUnderLine[indexX+1]
                        if (character === "@") {
                            rollCount++
                        }
                    }

                    let character = splitUnderLine[indexX]
                    if (character === "@") {
                        rollCount++
                    }
                }

                if (indexX - 1 >= 0) {
                    let character = chars[indexX-1]
                    if (character === "@") {
                        rollCount++
                    }
                }

                if (indexX + 1 < chars.length) {
                    let character = chars[indexX+1]
                    if (character === "@") {
                        rollCount++
                    }
                }

                if (rollCount < 4) {
                    toDelete.push({y: indexY, x: indexX})
                }
            }
        }
    }

    for (let pos of toDelete) {
        updatedLines[pos.y][pos.x] = "."
    }
    
    rollDeleted = toDelete.length

    if (rollDeleted === 0) {
        return 0
    } else {
        let newMap = updatedLines.map(line => line.join("")).join("\n")
        return rollDeleted + removeRoll(newMap)
    }
}

console.log(removeRoll(content))

export default readFile;
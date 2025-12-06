import * as fs from 'fs'

function readFile(): string {
    const input : string = fs.readFileSync("input.txt", 'utf8').trim();

    return input
}

let content : Array<string> = readFile().split("\n")

let ranges : Array<string> = content.splice(0, content.indexOf(''))
let ids : Array<string> = content.splice(content.indexOf(''), content.length).filter(id => id.trim() !== '')
let mappedIds = ids.map(id => ({
    value: id,
    markedAsAvailable: false
}))

for (let range of ranges) {
    let minimum : number = parseInt(range.split("-")[0])
    let maximum : number = parseInt(range.split("-")[1])

    for (let id of mappedIds) {
        let idValue = parseInt(id.value)
        
        if (minimum <= idValue && idValue <= maximum) {
            id.markedAsAvailable = true
        }
    }

    let availableIds = mappedIds.filter(id => id.markedAsAvailable).length
    console.log(`Did the operation for ${minimum} to ${maximum} and found ${availableIds} ids`)
}

export default readFile
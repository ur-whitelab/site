const fs = require('fs')
const yaml = require('js-yaml')

let regex = /^[0-9]+./gm
// get file name from argument
// read the file and replace regex matches with <li>
let fileName = process.argv[2]
let fileContent = fs.readFileSync(fileName, 'utf8')

let newContent = fileContent.replace(regex, '<li>')
let wrapped = newContent.split('\n').map((s) => s.length > 1 ? s : '')

// now read info about papers
let fileContents = fs.readFileSync('./bib/data.yml', 'utf8')
let data = yaml.load(fileContents)
for (const k in data) {
    entry = data[k]
    for (const i in wrapped) {
        line = wrapped[i]
        let v = entry.key.reduce((a, e) => line.toLowerCase().includes(String(e).toLowerCase()) && a, true)
        if (v) {
            // make new dom
            let dom = '<div class="paper-info">'
            for (const j in entry) {
                if (j != 'key') {
                    dom += `<a href="${entry[j]}">${j}</a> | `
                }
            }
            wrapped[i] += dom.slice(0, -2) + '</div>'
        }
    }
}


console.log(wrapped.reverse().join('\n'))
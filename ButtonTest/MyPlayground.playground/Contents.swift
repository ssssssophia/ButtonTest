import UIKit

let l = Array([0,2,5,6,7,9,10])

var arrayAll = Set(Array(0...11))
var setL = Set(l)

var freeHour = Array(arrayAll.subtracting(setL))
freeHour.sort()

var tempArray = (Array([[]]))
if !Array(0..<freeHour[0]).isEmpty {
    tempArray += [Array(0...freeHour[0]-1)]
    print(Array(0...freeHour[0]-1))
}
for i in (0...freeHour.count - 2) {
    if !Array(freeHour[i]+1..<freeHour[i+1]).isEmpty {
        tempArray += [Array(freeHour[i]+1..<freeHour[i+1])]
        print(Array(freeHour[i]+1..<freeHour[i+1]))
    }
}
if !Array(freeHour[freeHour.count-1]+1..<12).isEmpty {
    tempArray += [Array(freeHour[freeHour.count-1]+1..<12)]
    print(Array(freeHour[freeHour.count-1]+1..<12))
}

let busyHour = Array(tempArray.suffix(from: 1))
print(busyHour)

busyHour.count
busyHour[0].count
busyHour[0][0]
busyHour[2][0]

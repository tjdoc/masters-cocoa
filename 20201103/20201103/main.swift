import Foundation

// practice 1 Mission 1. Rectangle

struct Rectangle {
    var leftTopX: Int
    var leftTopY: Int
    var rightBottomX: Int
    var rightBottomY: Int
    func printRect() {
        print("(\(leftTopX), \(leftTopY)), (\(rightBottomX), \(leftTopY)), (\(rightBottomX), \(rightBottomY)), (\(leftTopX), \(rightBottomY))")
    }
}

// practice 1 Mission 2. 호출하기

var rect = Rectangle(leftTopX: 5, leftTopY: 11, rightBottomX: 15, rightBottomY: 4)
rect.printRect()

// practice 1 Mission 3. printArea()

struct Rectangle2 {
    var leftTopX: Int
    var leftTopY: Int
    var rightBottomX: Int
    var rightBottomY: Int
    func printRect() {
        print("(\(leftTopX), \(leftTopY)), (\(rightBottomX), \(leftTopY)), (\(rightBottomX), \(rightBottomY)), (\(leftTopX), \(rightBottomY))")
    }
    func printArea() {
        let area = (rightBottomX-leftTopX)*(leftTopY-rightBottomY)
        print(area)
    }
}
var rect2 = Rectangle2(leftTopX: 5, leftTopY: 11, rightBottomX: 15, rightBottomY: 4)
rect2.printArea()

// practice 1 Mission 4. Float

struct RectangleFloat {
    var leftTopX: Float
    var leftTopY: Float
    var rightBottomX: Float
    var rightBottomY: Float
    func printRect() {
        print("(\(leftTopX), \(leftTopY)), (\(rightBottomX), \(leftTopY)), (\(rightBottomX), \(rightBottomY)), (\(leftTopX), \(rightBottomY))")
    }
    func printArea() {
        let area = (rightBottomX-leftTopX)*(leftTopY-rightBottomY)
        print(area)
    }
}
var rect3 = RectangleFloat(leftTopX: 4.5, leftTopY: 10.5, rightBottomX: 15, rightBottomY: 3.5)
rect3.printArea()

// practice 1 Mission 5. Center

struct RectangleFloatCenter {
    var leftTopX: Float
    var leftTopY: Float
    var rightBottomX: Float
    var rightBottomY: Float
    func printRect() {
        print("(\(leftTopX), \(leftTopY)), (\(rightBottomX), \(leftTopY)), (\(rightBottomX), \(rightBottomY)), (\(leftTopX), \(rightBottomY))")
    }
    func printArea() {
        let area = (rightBottomX-leftTopX)*(leftTopY-rightBottomY)
        print(area)
    }
    func printCenter() {
        let centerX = (leftTopX + rightBottomX)/2
        let centerY = (leftTopY + rightBottomY)/2
        print("(\(centerX), \(centerY))")
    }
}
var rect4 = RectangleFloatCenter(leftTopX: 4.5, leftTopY: 10.5, rightBottomX: 15, rightBottomY: 3.5)
rect4.printCenter()

// 연습문제 2

// practice 2 Mission 1. MyPoint

struct MyPoint {
    var myX: Float
    var myY: Float
    func printPoint() {
        print("(\(myX), \(myY))")
    }
}
var pointA = MyPoint(myX:2.5, myY:15.8)
pointA.printPoint()

// practice 2 Mission 2. adding a method

struct MyPoint2 {
    var myX: Float
    var myY: Float
    func printPoint() {
        print("(\(myX), \(myY))")
    }
    mutating func setX(x:Float) {
        myX = x
    }
    mutating func setY(y:Float) {
        myY = y
    }
}

var pointB = MyPoint2(myX:2.5, myY:15.8)
pointB.setX(x:15.2)
pointB.setY(y:7.4)
pointB.printPoint()
print("pointB=(\(pointB.myX), \(pointB.myY))")

// practice 2 Mission 3. compute distance

struct MyPoint3 {
    var myX: Float
    var myY: Float
    func printPoint() {
        print("(\(myX), \(myY))")
    }
    mutating func setX(x:Float) {
        myX = x
    }
    mutating func setY(y:Float) {
        myY = y
    }
    func getDistance(toPoint: MyPoint3) -> Float {
        let distance = sqrt(pow(myX-toPoint.myX,2)+pow(myY-toPoint.myY,2))
        return distance
    }
}

var pointC = MyPoint3(myX:15.2, myY:7.4)
var pointD = MyPoint3(myX:15, myY:12.2)
print(pointC.getDistance(toPoint: pointD))

// 연습문제 3

// practice 3 Mission 1 MyPoint

struct RectanglePoint {
    var leftTop: MyPoint3
    var rightBottom: MyPoint3
    init() {
        self.leftTop = MyPoint3(myX:0, myY:0)
        self.rightBottom = MyPoint3(myX:0, myY:0)
    }
    init(fromLT leftTop:MyPoint3, fromRB rightBottom:MyPoint3) {
        self.leftTop = leftTop
        self.rightBottom = rightBottom
    }
    init(fromOrigin:MyPoint3, width:Float, height:Float) {
        self.leftTop = MyPoint3(myX:fromOrigin.myX, myY:fromOrigin.myY+height)
        self.rightBottom = MyPoint3(myX:fromOrigin.myY+width, myY:fromOrigin.myY)
    }
    func printRect() {
        print("(\(leftTop.myX), \(leftTop.myY)), (\(rightBottom.myX), \(leftTop.myY)), (\(rightBottom.myX), \(rightBottom.myY)), (\(leftTop.myX), \(rightBottom.myY))")
    }
    func printArea() {
        let area = (rightBottom.myX-leftTop.myX)*(leftTop.myY-rightBottom.myY)
        print(area)
    }
    func printCenter() {
        let centerX = (leftTop.myX + rightBottom.myX)/2
        let centerY = (leftTop.myY + rightBottom.myY)/2
        print("(\(centerX), \(centerY))")
    }
    mutating func moveTo(delta:MyPoint3){
        leftTop.myX += delta.myX
        leftTop.myY += delta.myY
        rightBottom.myX += delta.myX
        rightBottom.myY += delta.myY
    }
}
var rectA = RectanglePoint(fromLT: MyPoint3(myX:3, myY:5), fromRB: MyPoint3(myX:5, myY:2))
var rectC = RectanglePoint()
// testing
print("rectA")
rectA.printRect()
rectA.printArea()
rectA.printCenter()
print()
// default inital value test
print("rectB")
rectC.printRect()
rectB.printArea()
rectB.printCenter()

// practice 3 Mission 2 printPoints
var rectB = RectanglePoint(fromOrigin: MyPoint3(myX:5, myY:5), width: 5, height: 10)
rectB.printRect()

// practice 3 Mission 3 printPoints
rectB.moveTo(delta: MyPoint3(myX:-3, myY:1.5))
rectB.printRect()

// what is grade

func whatIsGrade(point: Int) -> Character {
    if point >= 90 {
        return "A"
    } else if point >= 80 {
        return "B"
    } else if point >= 70 {
        return "C"
    } else if point >= 60 {
        return "D"
    } else {
        return "F"
    }
}

var point: Float
for point in [100, 95, 85, 75, 65, 30] {
    print(whatIsGrade(point:point))
}

// gugu dan

func gugu(dan: Int) {
    for ii in 1...9 {
        print("\(dan) x \(ii) = \(dan*ii)")
    }
}

func makeAll() {
    for ii in 1...9 {
        gugu(dan:ii)
        print()
    }
}

makeAll()

func makeGugu(maxDan: Int) {
    for ii in 1...maxDan {
        print()
        for jj in 1...9 {
            print("\(ii) x \(jj) = \(ii*jj)")
        }
    }
}

makeGugu(maxDan:4)

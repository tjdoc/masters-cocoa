func convertInchToCM(_ fromInches : Float) -> Float {
    let out = fromInches*2.54
//    print("\(out)cm")
    return out
}

print(convertInchToCM(50))
print(convertInchToCM(15))

func convertCMToInch(_ fromCM : Float) -> Float {
    let out = fromCM/2.54
//    print("\(out)inch")
    return out
}

print(convertCMToInch(254))
print(convertCMToInch(75))

func convertMToInch(_ fromMeter : Float) -> Float {
    let out = fromMeter*100/2.54
//    print("\(out)inch")
    return out
}

print(convertMToInch(1.5))
print(convertMToInch(0.4))


// 추가미션

func autoConvert(_ inStr: String) -> String {
    let inputFloat = Float(inStr.filter{($0 > "0" && $0 <= "9") || $0 == "."})!
    let strSuffix = inStr.filter{($0 > "a" && $0 <= "z") || $0 == " "}
    var out = ""
    switch strSuffix {
    case "cm inch":
        out = String(convertCMToInch(inputFloat))+"inch"
    case "inch m":
        out = String(convertInchToCM(inputFloat)/100.0)+"m"
    case "m inch":
        out = String(convertCMToInch(inputFloat*100))+"inch"
    case "cm", "cm m":
        out = String(inputFloat/100.0)+"m"
    case "m", "m cm":
        out = String(inputFloat*100)+"cm"
    case "inch", "inch cm":
        out = String(convertInchToCM(inputFloat))+"cm"
    default:
        return "Unsupported conversion"
    }
    return "\(inStr) => \(out)"
}
print()
print(autoConvert("18cm inch"))
print(autoConvert("25.4inch m"))
print(autoConvert("0.5m inch"))
print(autoConvert("183cm"))
print(autoConvert("183cm m"))
print(autoConvert("3.14m"))
print(autoConvert("3.14m cm"))
print(autoConvert("2.54inch"))
print(autoConvert("2.54inch cm"))


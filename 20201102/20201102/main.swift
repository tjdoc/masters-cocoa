func convertToCM(fromInches : Float) -> Float {
    let out = fromInches*2.54
    print("\(out)cm")
    return out
}

_ = convertToCM(fromInches:50)
_ = convertToCM(fromInches:15)

func convertToInches(fromCM : Float) -> Float {
    let out = fromCM/2.54
    print("\(out)inch")
    return out
}

_ = convertToInches(fromCM:254)
_ = convertToInches(fromCM:75)

func convertToInches(fromMeter : Float) -> Float {
    let out = fromMeter*100/2.54
    print("\(out)inch")
    return out
}

_ = convertToInches(fromMeter:1.5)
_ = convertToInches(fromMeter:0.4)

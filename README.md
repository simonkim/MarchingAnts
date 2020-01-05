# MarchingAnts

A description of this package.

Usage
```swift
let imageView = UIImageView()
imageView.layer.isMarchingAntsVisible = true
```

Rectangular Marching Ants with custom colors
```swift
let label = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)

let ants = MarchingAnts(
    antColor: UIColor.red, 
    strokeColor: UIColor.blue
).boundingAnts(rect: label.bounds)

label.layer.addSublayer( ants )
```

Marching Ants with custom shape using `CGPath`
```swift
let label = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)

let customPath = UIBezierPath(...)
let ants = MarchingAnts().animatingAnts(path: customPath.cgPath)

label.layer.addSublayer( ants )
```



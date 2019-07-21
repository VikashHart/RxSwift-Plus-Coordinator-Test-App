import UIKit
import RxSwift

enum BaseColor {
    case red
    case green
    case blue
}

protocol ColorsVCViewModeling {
    var redValue: Observable<Float> { get }
    var greenValue: Observable<Float> { get }
    var blueValue: Observable<Float> { get }
    var rgbObservable: Observable<UIColor> { get }

    func update(baseColor: BaseColor, to newValue: Float)
}

class ColorsViewModel: ColorsVCViewModeling {

    var redValue: Observable<Float> {
        return redBehaviorSubject.asObservable()
    }

    var greenValue: Observable<Float> {
        return greenBehaviorSubject.asObservable()
    }

    var blueValue: Observable<Float> {
        return blueBehaviorSubject.asObservable()
    }

    lazy var rgbObservable: Observable<UIColor> = {
        return Observable.combineLatest(redValue, greenValue, blueValue) { (r, g, b) -> UIColor in
            return UIColor.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
        }
    }()

    var v = Variable<Float>(1)

    init(red: Float = 255,
         green: Float = 255,
         blue: Float = 255) {
        self.red = red
        self.green = green
        self.blue = blue
    }

    private var red: Float {
        didSet {
            // 1 2 3 x 4 5 6
            // 1 2 3 <-x 4 5 6
            redBehaviorSubject.onNext(red) //behaviour subject
            v.value = red //variable
        }
    }

    private var green: Float {
        didSet {
            greenBehaviorSubject.onNext(green)
        }
    }

    private var blue: Float {
        didSet {
            blueBehaviorSubject.onNext(blue)
        }
    }

    lazy private var redBehaviorSubject: BehaviorSubject<Float> = {
        return BehaviorSubject.init(value: self.red)
    }()

    lazy private var greenBehaviorSubject: BehaviorSubject<Float> = {
        return BehaviorSubject.init(value: self.green)
    }()

    lazy private var blueBehaviorSubject: BehaviorSubject<Float> = {
        return BehaviorSubject.init(value: self.blue)
    }()


    func update(baseColor: BaseColor, to newValue: Float) {
        switch baseColor {
        case .red:
            self.red = newValue
        case .green:
            green = newValue
        case .blue:
            blue = newValue
        }
    }
}

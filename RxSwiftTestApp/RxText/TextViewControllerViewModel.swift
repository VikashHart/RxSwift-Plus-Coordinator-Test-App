import Foundation
import RxSwift

protocol TextVCViewModeling {
    var labelText: Observable<String> { get }

    func update(text: String)
}

class TextVCViewModel: TextVCViewModeling {

    var labelText: Observable<String> {
        return labelTextBehaviorSubject.asObservable()
    }

    init(startText: String = "Enter text here") {
        self.startText = startText
    }

    private var startText: String {
        didSet {
            return labelTextBehaviorSubject.onNext(startText)
        }
    }

    private lazy var labelTextBehaviorSubject: BehaviorSubject<String> = {
        return BehaviorSubject.init(value: self.startText)
    }()

    func update(text: String) {
        startText = text
    }
}

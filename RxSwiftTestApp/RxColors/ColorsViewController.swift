import UIKit
import RxSwift

class ColorsViewController: UIViewController {

    weak var coordinator: MainCoordinator?
    let viewModel: ColorsVCViewModeling = ColorsViewModel()
    let colorsView = ColorsView()

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        configureButtons()
        configureSliders()
        configureSubscriptions()
        view.backgroundColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//        super.viewWillDisappear(animated)
//    } 

    private func configureSliders() {
        self.colorsView.redSlider.addTarget(self,
                                       action: #selector(updateSliderValue(sender:)),
                                       for: .valueChanged)
        colorsView.greenSlider.addTarget(self,
                                         action: #selector(updateSliderValue(sender:)),
                                         for: .valueChanged)
        colorsView.blueSlider.addTarget(self,
                                        action: #selector(updateSliderValue(sender:)),
                                        for: .valueChanged)
    }

    private func configureSubscriptions() {
        viewModel.redValue
            .observeOn(MainScheduler.instance)
            .subscribe { (event) in
                switch event {
                case .next(let value): print(value)
                    self.colorsView.redLabel.text = "Red: \(event)"
                case .error(let error): print(error)
                case .completed: break
                }
        }
            .disposed(by: disposeBag)

        viewModel.greenValue
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (value: Float) in
                self?.colorsView.greenLabel.text = "Green: \(value)"
        })
            .disposed(by: disposeBag)

        viewModel.blueValue
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (value: Float) in
                self?.colorsView.blueLabel.text = "Blue: \(value)"
            })
            .disposed(by: disposeBag)

        viewModel.rgbObservable
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (newColor) in
                self?.colorsView.backgroundColor = newColor
            })
            .disposed(by: disposeBag)

    }

    private func setupConstraints() {
        view.addSubview(colorsView)
        colorsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colorsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colorsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            colorsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }

    private func configureButtons() {
        self.colorsView.textVCButton.addTarget(self, action: #selector(presentTextVC), for: .touchUpInside)
    }

    @objc func updateSliderValue(sender: UISlider) {
        switch sender {
        case colorsView.redSlider:
            viewModel.update(baseColor: .red, to: sender.value)
        case colorsView.greenSlider:
            viewModel.update(baseColor: .green, to: sender.value)
        case colorsView.blueSlider:
            viewModel.update(baseColor: .blue, to: sender.value)
        default:
            break
        }
    }
    
    @objc func presentTextVC() {
        coordinator?.rxText()
    }
}

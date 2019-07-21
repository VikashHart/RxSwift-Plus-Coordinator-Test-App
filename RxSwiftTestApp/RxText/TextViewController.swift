import UIKit
import RxSwift

class TextViewController: UIViewController, UITextFieldDelegate {

    weak var coordinator: MainCoordinator?
    let viewModel: TextVCViewModeling = TextVCViewModel()
    let textView = TextView()

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        textView.textField.delegate = self
        configureSubscriptions()
        configureButtons()
        view.backgroundColor = .white
    }

    private func setupConstraints() {
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }

    private func configureSubscriptions() {
        viewModel.labelText
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (text) in
                self?.textView.reactiveLabel.text = text
            })
            .disposed(by: disposeBag)
    }

    private func configureButtons() {
        self.textView.backButton.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)
    }

    @objc func navigateBack() {
        coordinator?.dismiss()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let newText = textField.text else { return false }
        let text = "\(newText + string)"

        viewModel.update(text: text)

        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}

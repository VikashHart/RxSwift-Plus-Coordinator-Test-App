import UIKit
import RxSwift

class TextView: UIView {

    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var textField: UITextField = {
        let tf = UITextField()
        tf.contentMode = .center
        tf.placeholder = "Enter text here"
        tf.returnKeyType = .done
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    lazy var reactiveLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.backgroundColor = .black
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 1
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }

    private func setupViews() {
        setupBackButton()
        setupLabel()
        setupTextField()
    }

    private func setupBackButton() {
        addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
            ])
    }

    private func setupLabel() {
        addSubview(reactiveLabel)
        NSLayoutConstraint.activate([
            reactiveLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 100),
            reactiveLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            reactiveLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            reactiveLabel.heightAnchor.constraint(equalToConstant: 44)
            ])
    }

    private func setupTextField() {
        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: reactiveLabel.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 44)
            ])
    }
}

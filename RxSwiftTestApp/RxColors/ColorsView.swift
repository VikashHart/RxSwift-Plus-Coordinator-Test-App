import UIKit
import RxSwift

class ColorsView: UIView {

    lazy var textVCButton: UIButton = {
        let button = UIButton()
        button.setTitle("Text VC", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

   lazy var redLabel: UILabel = {
        let label = UILabel()
        label.text = "Red:"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var redSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 255
        slider.value = 255
        slider.isContinuous = true
        slider.tintColor = .red
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()

    lazy var greenLabel: UILabel = {
        let label = UILabel()
        label.text = "Green:"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var greenSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 255
        slider.value = 255
        slider.isContinuous = true
        slider.tintColor = .green
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()

    lazy var blueLabel: UILabel = {
        let label = UILabel()
        label.text = "Blue:"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var blueSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 255
        slider.value = 255
        slider.isContinuous = true
        slider.tintColor = .blue
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
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
        setupTextVcButton()
        setupBlueSlider()
        setupBlueLabel()
        setupGreenSlider()
        setupGreenLabel()
        setupRedSlider()
        setupRedLabel()
    }

    private func setupTextVcButton() {
        addSubview(textVCButton)
        NSLayoutConstraint.activate([
            textVCButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            textVCButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textVCButton.widthAnchor.constraint(equalToConstant: 80)
            ])
    }

    private func setupBlueSlider() {
        addSubview(blueSlider)
        NSLayoutConstraint.activate([
            blueSlider.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            blueSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            blueSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
            ])
    }

    private func setupBlueLabel() {
        addSubview(blueLabel)
        NSLayoutConstraint.activate([
            blueLabel.bottomAnchor.constraint(equalTo: blueSlider.topAnchor, constant: -10),
            blueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            blueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60)
            ])
    }

    private func setupGreenSlider() {
        addSubview(greenSlider)
        NSLayoutConstraint.activate([
            greenSlider.bottomAnchor.constraint(equalTo: blueLabel.topAnchor, constant: -10),
            greenSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            greenSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
            ])
    }

    private func setupGreenLabel() {
        addSubview(greenLabel)
        NSLayoutConstraint.activate([
            greenLabel.bottomAnchor.constraint(equalTo: greenSlider.topAnchor, constant: -10),
            greenLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            greenLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60)
            ])
    }

    private func setupRedSlider() {
        addSubview(redSlider)
        NSLayoutConstraint.activate([
            redSlider.bottomAnchor.constraint(equalTo: greenLabel.topAnchor, constant: -10),
            redSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            redSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
            ])
    }

    private func setupRedLabel() {
        addSubview(redLabel)
        NSLayoutConstraint.activate([
            redLabel.bottomAnchor.constraint(equalTo: redSlider.topAnchor, constant: -10),
            redLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            redLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60)
            ])
    }
}

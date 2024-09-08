//import UIKit
//
//public class CrosswordView: UIView {
//    private let questions: [String] = [
//        "Столица Франции — 5 букв",
//        "Столица Италии — 3 буквы"
//    ]
//    
//    private let answers: [String] = ["Париж", "Рим"]
//    
//    private var currentQuestionIndex = 0
//
//    private let questionLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 18)
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private let answerTextField: UITextField = {
//        let textField = UITextField()
//        textField.borderStyle = .roundedRect
//        textField.placeholder = "Введите ответ"
//        return textField
//    }()
//    
//    private let submitButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Проверить", for: .normal)
//        return button
//    }()
//    
//    private let resultLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 16)
//        label.textAlignment = .center
//        label.textColor = .red
//        label.numberOfLines = 0
//        return label
//    }()
//
//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//        showQuestion()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupView() {
//        addSubview(questionLabel)
//        addSubview(answerTextField)
//        addSubview(submitButton)
//        addSubview(resultLabel)
//        
//        questionLabel.translatesAutoresizingMaskIntoConstraints = false
//        answerTextField.translatesAutoresizingMaskIntoConstraints = false
//        submitButton.translatesAutoresizingMaskIntoConstraints = false
//        resultLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            questionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
//            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            
//            answerTextField.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
//            answerTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
//            answerTextField.widthAnchor.constraint(equalToConstant: 200),
//            
//            submitButton.topAnchor.constraint(equalTo: answerTextField.bottomAnchor, constant: 20),
//            submitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
//            
//            resultLabel.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 60),
//            resultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
//        ])
//        
//        submitButton.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
//    }
//
//    private func showQuestion() {
//        if currentQuestionIndex < questions.count {
//            questionLabel.text = questions[currentQuestionIndex]
//            answerTextField.text = ""
//            resultLabel.text = ""
//        } else {
//            questionLabel.text = "Вы прошли все вопросы!"
//            answerTextField.isHidden = true
//            submitButton.isHidden = true
//        }
//    }
//    
//    @objc private func checkAnswer() {
//        guard currentQuestionIndex < answers.count else { return }
//        let correctAnswer = answers[currentQuestionIndex].lowercased()
//        let userAnswer = answerTextField.text?.lowercased() ?? ""
//        
//        if userAnswer == correctAnswer {
//            resultLabel.textColor = .green
//            resultLabel.text = "Правильно!"
//            currentQuestionIndex += 1
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
//                self?.showQuestion()
//            }
//        } else {
//            resultLabel.textColor = .red
//            resultLabel.text = "Неправильно, попробуйте снова."
//        }
//    }
//}

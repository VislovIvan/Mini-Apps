import Foundation
import UIKit
import CrosswordSPM

class CrosswordCell: UITableViewCell {
    private var crosswordView: CrosswordView?
    
    func setupGame() {
        if crosswordView == nil {
            let newCrosswordView = CrosswordView()
            contentView.addSubview(newCrosswordView)
            
            newCrosswordView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                newCrosswordView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                newCrosswordView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                newCrosswordView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
                newCrosswordView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6)
            ])
            
            crosswordView = newCrosswordView
        }
    }
}

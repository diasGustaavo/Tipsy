import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var resultTextLabel: UILabel!
    
    var totalPerPersonValue: String?
    var resultText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalPerPersonValue
        resultTextLabel.text = resultText
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}

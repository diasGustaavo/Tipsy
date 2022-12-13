import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var billTotalField: UITextField!
    @IBOutlet weak var percent20Tip: UIButton!
    @IBOutlet weak var percent10Tip: UIButton!
    @IBOutlet weak var percent0Tip: UIButton!
    @IBOutlet weak var splitAmount: UILabel!
    @IBOutlet weak var billTotal: UITextField!
    
    var billBrain = BillBrain(selectedBillTotal: 0.0, selectedSelectedTip: 0.1, selectedSplitAmount: 2)
    
    @IBAction func calculateButton(_ sender: UIButton) {
        if billBrain.selectedBillTotal != 0 {
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    @IBAction func billEditingEnded(_ sender: UITextField) {
        let content = sender.largeContentTitle
        let contentConverted = content?.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
        
        billBrain.setSelectedBillTotal(total: Float(contentConverted!) ?? 0.0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.resultText = billBrain.getResultText()
            destinationVC.totalPerPersonValue = String(format: "%.2f", billBrain.getAmountPerPerson())
        }
    }
    
    @IBAction func tipSelected(_ sender: UIButton) {
        view.endEditing(true)
        percent0Tip.isSelected = false
        percent10Tip.isSelected = false
        percent20Tip.isSelected = false
        
        switch sender.titleLabel?.text {
        case "20%":
            percent20Tip.isSelected = true
            billBrain.setSelectedTip(tip: 1.2)
        case "10%":
            percent10Tip.isSelected = true
            billBrain.setSelectedTip(tip: 1.1)
        case "0%":
            percent0Tip.isSelected = true
            billBrain.setSelectedTip(tip: 1.0)
        default:
            print("error selecting tip")
        }
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        view.endEditing(true)
        
        let stepperAmount = String(format: "%.0f", sender.value)
        let stepperAmountAsInt = Int(stepperAmount)!
        splitAmount.text = stepperAmount
        billBrain.setSelectedSplitAmount(amount: stepperAmountAsInt)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


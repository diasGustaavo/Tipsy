import Foundation

struct BillBrain {
    var selectedBillTotal: Float?
    var selectedTip: Float?
    var selectedSplitAmount: Int?
    
    init(selectedBillTotal: Float? = nil, selectedSelectedTip: Float? = nil, selectedSplitAmount: Int? = nil) {
        self.selectedBillTotal = selectedBillTotal
        self.selectedTip = selectedSelectedTip
        self.selectedSplitAmount = selectedSplitAmount
    }
    
    mutating func setSelectedBillTotal(total: Float) {
        selectedBillTotal = total
    }
    
    mutating func setSelectedTip(tip: Float) {
        selectedTip = tip
    }
    
    mutating func setSelectedSplitAmount(amount: Int) {
        selectedSplitAmount = amount
    }
    
    func getAmountPerPerson() -> Float {
        return (selectedBillTotal! * selectedTip!) / Float(selectedSplitAmount!)
    }
    
    func getTipString() -> String {
        switch selectedTip {
        case 1.0:
            return "0%"
        case 1.1:
            return "10%"
        case 1.2:
            return "20%"
        default:
            return "X%"
        }
    }
    
    func getResultText() -> String {
        return "Split between \(String(describing: selectedSplitAmount!)) people, with \(getTipString()) tip."
    }
}

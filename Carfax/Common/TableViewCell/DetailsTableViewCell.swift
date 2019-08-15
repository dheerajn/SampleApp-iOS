//
//  DetailsTableViewCell.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import UIKit

class DetailsTableViewCell: BaseTableViewCell, CellViewConfigurable {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var trim: UILabel!
    @IBOutlet weak var yearMakeModel: UILabel!
    @IBOutlet weak var mileage: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var callButton: UIButton!
    
    var viewModel: CellConfigurable! {
        didSet {
            guard let vm = viewModel as? DetailsTableViewCellConfigurable else { return }
            
            dispatchOnMainQueue {
                self.location.text = vm.locationText
                self.trim.text = vm.trimText
                self.yearMakeModel.text = vm.yearMakeModelText
                self.mileage.text = vm.mileageText
                self.price.text = vm.priceText
                self.callButton.setTitle(vm.callButtonText, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func callButtonAction(_ sender: Any) {
        (self.viewModel as? DetailsTableViewCellConfigurable)?.callButtonAction()
    }
    
    static func reuseID() -> String {
        return "DetailsTableViewCell"
    }
}

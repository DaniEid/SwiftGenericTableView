//
//  ExampleTableViewCell.swift
//  GenericTableView
//
//  Created by Dani Eid on 2021-01-24.
//

import UIKit

class ExampleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageExample: UIImageView!
    @IBOutlet weak var exampleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func loadData(url: String, title: String) {
        imageExample.load(url: url)
        exampleLabel.text = title
    }
    
}


extension UIImageView {
    func load(url: String) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf:  URL(string: url)! ) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

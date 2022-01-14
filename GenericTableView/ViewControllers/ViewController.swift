//
//  ViewController.swift
//  GenericTableView
//
//  Created by Dani Eid on 2021-01-24.
//

import UIKit

class ViewController: GenericTableViewController<NameExampleCellModel>  {
    
    let firstSectionData = [
        NameExampleCellModel(imageURL: "https://thispersondoesnotexist.com/image", title: "Test", backGroundColor: .black),
        NameExampleCellModel(imageURL: "https://thispersondoesnotexist.com/image", title: "Test", backGroundColor: .black)]
    
    let secondSectionData = [
        NameExampleCellModel(imageURL:"https://thispersondoesnotexist.com/image", title: "Test in the second Row",
                             backGroundColor: .red),
        NameExampleCellModel(imageURL: "https://thispersondoesnotexist.com/image", title: "Test 2", backGroundColor: .yellow)]
    
    

    ///our table view that was added in StoryBoard
    @IBOutlet  var tableView: UITableView! {
        didSet{
            // handling delegate and things related to table view it self
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.separatorStyle = .none
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       //all the data can be within the first section only
        self.datasource = [0 : firstSectionData,
                           1 : secondSectionData]
        //this should be called after filling the
        self.registerCellFor(tableView: self.tableView, withCells: [ExampleTableViewCell.self, SecondTableViewCell.self])
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0) {
            let cell = reusableCellFor(tableView: tableView, reuseClass: (ExampleTableViewCell.self)) as ExampleTableViewCell
            print(cell)
            if let item = itemFor(indexPath: indexPath) {
                cell.imageExample!.load(url: item.imageURL)
                cell.exampleLabel!.text = item.title
            }
            return cell
        } else {
            let cell = reusableCellFor(tableView: tableView, reuseClass: (SecondTableViewCell.self)) as SecondTableViewCell
     
            if let item = itemFor(indexPath: indexPath) {
                cell.titleLabel.text = item.title
                cell.backgroundColor = item.backGroundColor
            }
            return cell
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SecondScreenSegue", sender: self)
    }


}


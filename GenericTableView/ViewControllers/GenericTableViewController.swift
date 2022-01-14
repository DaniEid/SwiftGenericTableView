//
//  GenericTableViewController.swift
//  GenericTableView
//
//  Created by Dani Eid on 2021-01-24.
//

import Foundation
import UIKit



/**
 T: represent the model which will represent  the data source
 
 each Table view controller will have the ability to inherit from this controller and will have simple implementation and it can be added to each cell
 */

class GenericTableViewController<T>: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    ///represent the data that should be handled in the form of [section : data], the keys will be the number of sections in the table view and the value of this key will be the data
    var datasource : [Int : [T]]?
    
    
    ///We should override this function in order to add data to our configured cells, this can be improved if we have only one cell in the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        if let datasource = datasource {
            return datasource.keys.count
        }else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let datasource = datasource {
            if let array = datasource[section] {
                return array.count
            }
        }
        return 0
    }
    
    
    ///helper function that will register all cells of the table view
    ///cells is an array of the cells that we want to register within the table view
    func registerCellFor(tableView : UITableView,withCells: [AnyClass]? ) {
        if let classes = withCells {
            for reuseClass in classes {
                tableView.register(UINib(nibName: String(describing: reuseClass.self)  , bundle: nil), forCellReuseIdentifier: String(describing: reuseClass.self) )
            }
        }
    }
    
    ///this function will simply dequeue the registered cell from a specific type
    func reusableCellFor<CustomTableViewCell : UITableViewCell>(tableView : UITableView, reuseClass : CustomTableViewCell.Type) -> CustomTableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:reuseClass.self)) as? CustomTableViewCell {
            return cell
        }else{
            return CustomTableViewCell(style: .subtitle, reuseIdentifier: String(describing:reuseClass))
        }
    }
    
    ///this is a helper function that will return the situable data for each row in each section
    func itemFor(indexPath : IndexPath) -> T? {
        if let datasource = self.datasource {
            if let array = datasource[indexPath.section] {
                return array[indexPath.row]
            }
        }
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Override didSelectRowAt to do you stuff")
    }
    
    
}

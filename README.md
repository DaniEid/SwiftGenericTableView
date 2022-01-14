# Generic Table view
The is a simple example of how to create generic table view and how to make use of this table view

## About This example
This project will show how to create generic table view.
Our generic table view class will be defined as GenericTableViewController<T> where T represent the generic model that we will inform the table view to use, and we can add some enhancment to have base model that all of our models will inharite from.
The generic class will contain a data source which will be represnted by a map data structure that will have the keys as numbers of the sections in the table view and the value of this key will be the data


## Getting Started
After cloning the project you will notice that we have model which will represent our data model, we will also use and get the help from UITableViewCell and currently we will create two different cells and add them to our table view in order to show the use of the table view with multi cells type


### Running the Project
Simply clone the project and hit run on any device/simulator you want

### References
In order to add images i have used this useful tool [thispersondoesnotexist](https://thispersondoesnotexist.com/)
I have used and read more about generics from swift docs [here](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

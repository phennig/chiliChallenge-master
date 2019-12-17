import UIKit
import SCLAlertView

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate {

    //starters, lunch combo, burger, sand, soup/salad, steak/seafoo, freshmex, texas/ribs/lunch combos
    let sectionTitles = ["Starters", "Entrees","Lunch Combos", "Drinks","Sides", "Desserts",]
    var numberOfItems = 0
    var item = ""
    var appetizers = ["Chips and Dip", "Nachos", "Calamari", "Queso Dip"]
    var entrees = ["Chicken","Steak","Seafood", "Pasta", "Pizza", "Burgers" ]
    var sides = ["Fries","Salad", "Chips","Fruit" ]
    var drinks = ["Water", "Pop", "Alcohol","Lemonade"]
    var desserts = ["Cake", "Ice Cream", "Brownie", "Pie", "Shake"]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chillis: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        chillis.image = UIImage(named: "ch")
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func button(_ sender: UIButton){
        alert()
    }
   
    func alert(){
        let alertViewResponder: SCLAlertViewResponder = SCLAlertView().showSuccess("Hello Customer", subTitle: "This is your order.")
        SCLAlertView().showInfo("Important info", subTitle: "You are great")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 70
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        return 30
//    }
      
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.text = sectionTitles[section]
        label.font = UIFont(name: "Sabo", size: 100)
        return label
    }
      
    func numberOfSections(in tableView: UITableView) -> Int{
        return 6
    }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section == 0{
            return appetizers.count
        }
        else if section == 1{
            return entrees.count
        }
        else{
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.font = UIFont(name: "Futura", size: 30)

        if indexPath.section == 0 {
            item = appetizers[indexPath.row]
            cell?.textLabel?.text = item
            return cell!
        }
        else if  indexPath.section == 1 {
            item = entrees[indexPath.row]
            cell?.textLabel?.text = item
        }
        else if  indexPath.section == 2 {
            item = sides[indexPath.row]
            cell?.textLabel?.text = item
        }
        else if  indexPath.section == 3 {
            item = drinks[indexPath.row]
            cell?.textLabel?.text = item
        }
        else if  indexPath.section == 4 {
            item = sides[indexPath.row]
            cell?.textLabel?.text = item
        }
        else if  indexPath.section == 5 {
            item = desserts[indexPath.row]
            cell?.textLabel?.text = item
        }
        else {
            print ("cell")
        }
        return cell!
    }
  
}

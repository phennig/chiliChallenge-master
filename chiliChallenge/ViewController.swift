import UIKit
import SCLAlertView

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate {

    //starters, lunch combo, burger, sand, soup/salad, steak/seafoo, freshmex, texas/ribs/lunch combos
    let sectionTitles = ["Starters", "Entrees","Lunch Combos", "Drinks","Sides", "Desserts",]
    var numberOfItems = 0
    var item = ""
    var appetizers = ["Chips and Dip", "Nachos", "Calamari", "Queso Dip"]
    var entrees = ["Chicken","Steak","Seafood", "Pasta", "Pizza", "Burgers" ]
    var sides = ["Fries","Salad" ]
    var drinks = [ "Water", "Pop", "Alcohol"]
    
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
        return 35
    }
      
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.text = sectionTitles[section]
        label.font = UIFont(name: "Cambria", size: 30)
        return label
    }
      
    func numberOfSections(in tableView: UITableView) -> Int{
        return 4
    }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if indexPath.section == 0 {
            item = appetizers[indexPath.row]
            cell?.textLabel?.text = item
            cell?.textLabel?.font = UIFont(name: "Cambria", size: 25)
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
        else {
            print ("cell")
        }
        return cell!
    }
  
}

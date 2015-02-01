import UIKit

class myViewController3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toView2Pressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
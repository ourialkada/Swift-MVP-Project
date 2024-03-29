
import Foundation
import UIKit

class DetailScreenViewController: UIViewController,DetailScreenViewDelegate {
   
   
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var image: UIImageView!
    private let detailPresentor = DetailScreenPresentor()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Spinner.start()
        detailPresentor.setViewDelegate(detailScreenDelegate: self)
        detailPresentor.getDocument(detailScreenDelegate: self)
    }
    
    
    
    func setData(product:detailedProduct) {
        Spinner.stop()
        self.name.text = product.name
        self.desc.text = product.description
        self.price.text = "$ \(product.price)"
        self.quantity.text = "\(product.quantity)"
        self.image.image = product.image
        
    }
    
    func errorMessage(message: String) {
        Spinner.stop()
        let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        close((Any).self)
    }
    
    
    
    @IBAction func close(_ sender: Any) {
        self.view.removeFromSuperview()
    }
}

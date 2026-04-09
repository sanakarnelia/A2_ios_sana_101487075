//
//  AddProductViewController.swift
//  A2_ios_sana_101487075
//
//  Created by Maaz Karnelia on 2026-04-09.
//

import CoreData
import UIKit

class AddProductViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var providerField: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        
        let newProduct = Product(context: context)
        newProduct.productID = Int64.random(in: 100...999)
        newProduct.productName = nameField.text
        newProduct.productDescription = descField.text
        newProduct.productPrice = Double(priceField.text ?? "") ?? 0
        newProduct.productProvider = providerField.text
        
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print("Error saving")
        }
    }
}

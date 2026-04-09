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
        
        guard let name = nameField.text, !name.isEmpty,
                 let desc = descField.text, !desc.isEmpty,
                 let priceText = priceField.text, let price = Double(priceText),
                 let provider = providerField.text, !provider.isEmpty else {

               print("Missing fields")
               return
           }

           let newProduct = Product(context: context)
           newProduct.productID = Int64.random(in: 100...999)
           newProduct.productName = name
           newProduct.productDescription = desc
           newProduct.productPrice = price
           newProduct.productProvider = provider

           do {
               try context.save()
               print("Saved successfully") 
               navigationController?.popViewController(animated: true)
           } catch {
               print("Error saving: \(error)")
           }
       }
    
    }


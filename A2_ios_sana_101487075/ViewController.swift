//
//  ViewController.swift
//  A2_ios_sana_101487075
//
//  Created by Maaz Karnelia on 2026-04-08.
//

import UIKit
import CoreData

class ViewController: UIViewController,UISearchBarDelegate {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!

    @IBOutlet weak var searchBar: UISearchBar!

    var products: [Product] = []
    var filteredProducts: [Product] = []
    var currentIndex = 0

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
      
        super.viewDidLoad()

            searchBar.delegate = self

            fetchProducts()

            if products.isEmpty {
                addDefaultProducts()
                fetchProducts()
            }

            filteredProducts = products
            displayProduct()
           
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        fetchProducts()
        filteredProducts = products

        if currentIndex >= filteredProducts.count {
            currentIndex = filteredProducts.count - 1
        }

        displayProduct()
    }
    func displayProduct() {
        if filteredProducts.isEmpty { return }

        let product = filteredProducts[currentIndex]
        idLabel.text = "\(product.productID)"
        nameLabel.text = product.productName
        descLabel.text = product.productDescription
        priceLabel.text = " $\(product.productPrice)"
        providerLabel.text = " \(product.productProvider ?? "")"
    }

    func fetchProducts() {
        let request: NSFetchRequest<Product> = Product.fetchRequest()

        do {
            products = try context.fetch(request)
        } catch {
            print("Error fetching")
        }
    }

    func addDefaultProducts() {
        for i in 1...10 {
            let newProduct = Product(context: context)
            newProduct.productID = Int64(i)
            newProduct.productName = "Product \(i)"
            newProduct.productDescription = "Description \(i)"
            newProduct.productPrice = Double(i * 10)
            newProduct.productProvider = "Provider \(i)"
        }

        try? context.save()
    }
    @IBAction func previousTapped(_ sender: UIButton) {
        if currentIndex > 0 {
            currentIndex -= 1
            displayProduct()
        }
    }
    @IBAction func nextTapped(_ sender: UIButton) {
        if currentIndex < filteredProducts.count - 1 {
            currentIndex += 1
            displayProduct()
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

           if searchText.isEmpty {
               filteredProducts = products
           } else {
               filteredProducts = products.filter {
                   $0.productName!.lowercased().contains(searchText.lowercased()) ||
                   $0.productDescription!.lowercased().contains(searchText.lowercased())
               }
           }

           currentIndex = 0
           displayProduct()
       }
}


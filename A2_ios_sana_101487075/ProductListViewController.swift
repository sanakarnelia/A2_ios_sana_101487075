//
//  ProductListViewController.swift
//  A2_ios_sana_101487075
//
//  Created by Maaz Karnelia on 2026-04-09.
//


import UIKit
import CoreData

class ProductListViewController: UITableViewController {

    var products: [Product] = []

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchProducts()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchProducts()
    }

    func fetchProducts() {
        let request: NSFetchRequest<Product> = Product.fetchRequest()

        do {
            products = try context.fetch(request)
            tableView.reloadData()
        } catch {
            print("Error fetching")
        }
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let product = products[indexPath.row]

        cell.textLabel?.text = product.productName
        cell.detailTextLabel?.text = product.productDescription

        return cell
    }
}

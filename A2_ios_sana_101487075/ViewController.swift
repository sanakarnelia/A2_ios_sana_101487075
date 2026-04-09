//
//  ViewController.swift
//  A2_ios_sana_101487075
//
//  Created by Maaz Karnelia on 2026-04-08.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
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
        // Do any additional setup after loading the view.
    }


}


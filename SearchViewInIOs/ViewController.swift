//
//  ViewController.swift
//  SearchViewInIOs
//
//  Created by alumno on 7/03/17.
//  Copyright © 2017 william. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {

    @IBOutlet weak var mTableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var dispositivoFiltrados = Array<Dispositivo>()
    
    var dispositivos = Array<Dispositivo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchController.searchResultsUpdater = self
        mTableView.tableHeaderView = searchController.searchBar
        
        for i in 1...9 {
            let dispositivo = Dispositivo()
            switch i {
            case 1:
                dispositivo.nombre = "iphone"
                dispositivo.precio = 599.0
                dispositivo.fabricacion = "2007"
                break
            case 2:
                dispositivo.nombre = "iPod"
                dispositivo.precio = 699.0
                dispositivo.fabricacion = "2008"
                break
            case 3:
                dispositivo.nombre = "iPod Touch"
                dispositivo.precio = 799.0
                dispositivo.fabricacion = "2009"
                break
            case 4:
                dispositivo.nombre = "iPad"
                dispositivo.precio = 899.0
                dispositivo.fabricacion = "2010"
                break
            case 5:
                dispositivo.nombre = "iPad mini"
                dispositivo.precio = 999.0
                dispositivo.fabricacion = "2011"
                break
            case 6:
                dispositivo.nombre = "iMac"
                dispositivo.precio = 1099.0
                dispositivo.fabricacion = "2012"
                break
            case 7:
                dispositivo.nombre = "Mac Pro"
                dispositivo.precio = 1199.0
                dispositivo.fabricacion = "2013"
                break
            case 8:
                dispositivo.nombre = "MacBook Air"
                dispositivo.precio = 1299.0
                dispositivo.fabricacion = "2014"
                break
            default:
                dispositivo.nombre = "MacBook Pro"
                dispositivo.precio = 1399.0
                dispositivo.fabricacion = "2015"
                break
            }
            dispositivos.append(dispositivo)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive && searchController.searchBar.text != "" {
            return dispositivoFiltrados.count
        }
        
        return dispositivos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "celda", for: indexPath)
        
        let item:Dispositivo
        if searchController.isActive && searchController.searchBar.text != "" {
            item = dispositivoFiltrados[indexPath.row]
        } else {
            item = dispositivos[indexPath.row]
        }
        
        
        
        cell.textLabel?.text = item.nombre
        cell.detailTextLabel?.text = "$\(item.precio!) | \(item.fabricacion!)"
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let texto = searchController.searchBar.text
        dispositivoFiltrados = dispositivos.filter({ (dispositivo) -> Bool in
            return dispositivo.nombre.lowercased().contains(texto!.lowercased()) ||
                String(dispositivo.precio).contains(texto!) || dispositivo.fabricacion.contains(texto!)
        })
        mTableView.reloadData()
    }
    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        return dispositivos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        let item = dispositivos[indexPath.row]
        
        cell.textLabel?.text = item.nombre
        cell.detailTextLabel?.text = "$\(item.precio) | \(item.fabricacion)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 */


}


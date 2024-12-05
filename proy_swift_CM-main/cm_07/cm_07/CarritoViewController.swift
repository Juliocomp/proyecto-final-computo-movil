//
//  CarritoViewController.swift
//  cm_07
//
//  Created by Gonzalez Julio on 04/12/24.
//
import UIKit

class CarritoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Tabla para mostrar los elementos del carrito
    @IBOutlet weak var tablaCarrito: UITableView!
    @IBOutlet weak var label_cantidad: UILabel!
    
    // Variable para almacenar los elementos del carrito
    var itemsCarrito: [(nombre: String, cantidad: Int)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configurar la tabla
        tablaCarrito.dataSource = self
        tablaCarrito.delegate = self
        label_cantidad.text = String(total_compra)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsCarrito.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarritoCell", for: indexPath)
        
        // Configurar la celda
        let item = itemsCarrito[indexPath.row]
        cell.textLabel?.text = "\(item.nombre) x \(item.cantidad)"
        
        return cell
    }
    
    // MARK: - Métodos de UITableViewDelegate (Opcional)
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Eliminar el elemento del carrito
            itemsCarrito.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    // Método opcional para calcular el total de elementos
    func calcularTotal() -> Int {
        return itemsCarrito.reduce(0) { $0 + $1.cantidad }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tablaCarrito.reloadData() // Recarga la tabla al mostrar la vista
    }
}

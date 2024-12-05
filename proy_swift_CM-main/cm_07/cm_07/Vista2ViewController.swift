//
//  Vista2ViewController.swift
//  cm_07
//
//  Created by Germán Santos Jaimes on 18/09/24.
//

import UIKit

class Vista2ViewController: UIViewController {
    
    var recibe = ""
    var recibeImagen: UIImage?
    var recibe_precio: Double = 0
    
    @IBOutlet weak var label_nombre: UILabel!
    @IBOutlet weak var label_cantidad: UILabel!
    @IBOutlet weak var label_total: UILabel!
    @IBOutlet weak var botonmas: UIButton!
    @IBOutlet weak var botonmenos: UIButton!
    @IBOutlet weak var botonanadir: UIButton!
    @IBOutlet weak var imagen_sel: UIImageView!
    
    
    var contador: Int = 0 // Contador que controla el valor del label_cantidad
    var cantidad: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label_nombre.text = recibe
        label_total.text = String(recibe_precio)
        imagen_sel.image = recibeImagen
        imagen_sel.layer.cornerRadius = imagen_sel.frame.size.width / 2
        imagen_sel.clipsToBounds = true
        actualizarLabelCantidad()
        
    }
    
    func actualizarLabelCantidad() {
        // Actualiza el texto del label de cantidad
        label_cantidad.text = "\(contador)"
        
        // Convierte contador a Float y calcula el total
        let contadorFloat = Double(contador)
        cantidad = contadorFloat * recibe_precio
        
        // Actualiza el texto del label total
        label_total.text = "Precio: $ \(String(format: "%.2f", cantidad))"
        

    }
    
    @IBAction func incrementar(_ sender: UIButton) {
        if(contador<8){
            contador += 1
            actualizarLabelCantidad()
        }

    }
    
    @IBAction func decrementar(_ sender: UIButton) {
        if (contador>0){
            contador -= 1
            actualizarLabelCantidad()
        }

    }
    
    @IBAction func añadirCarrito(_ sender: UIButton) {
        guard contador > 0 else {
               let alerta = UIAlertController(title: "Error", message: "No puedes añadir 0 elementos.", preferredStyle: .alert)
               alerta.addAction(UIAlertAction(title: "Ok", style: .default))
               present(alerta, animated: true)
               return
           }
        total_compra+=cantidad
        let alerta = UIAlertController(title: "Exito", message: "Boletos añadidos correctamente", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alerta, animated: true)
        
           if let carritoVC = storyboard?.instantiateViewController(withIdentifier: "CarritoViewController") as? CarritoViewController {
               carritoVC.itemsCarrito.append((nombre: recibe, cantidad: contador))
               carritoVC.tablaCarrito?.reloadData() // Asegura que la tabla se actualice
               navigationController?.pushViewController(carritoVC, animated: true)
           }
    }
}

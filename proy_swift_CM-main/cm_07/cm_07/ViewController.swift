//
//  ViewController.swift
//  cm_07
//
//  Created by Germán Santos Jaimes on 18/09/24.
//
var total_compra: Double = 0.00
import UIKit
struct Alumno {
    var nombre: String
    var imagenNombre: String
    var precio: Double
}


class ViewController: UIViewController, UITableViewDataSource {
    
    //var alumnos:[String] = ["Juan", "Pedro", "Luis", "Diana"]
    var alumnos: [Alumno] = [
        Alumno(nombre: "BMTH", imagenNombre: "bmth", precio:50.00),
            Alumno(nombre: "Aurora", imagenNombre: "aurora", precio:60.00),
            Alumno(nombre: "Morat", imagenNombre: "morat", precio:70.00),
            Alumno(nombre: "Linkin Park", imagenNombre: "lp", precio:50.00),
            Alumno(nombre: "Cuarteto de Nos", imagenNombre: "cuarteto", precio:20.00),
            Alumno(nombre: "Sara Landry", imagenNombre: "sara", precio:100.00),
            Alumno(nombre: "AXE Ceremonia 2024", imagenNombre: "ceremonia", precio:50.00),
            
        ]
    @IBOutlet weak var tabla : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaTableViewCell
        
        cell.letrero.text = alumnos[indexPath.row].nombre
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //var MyindexPath = tabla.indexPathForSelectedRow
        //var info = alumnos[MyindexPath!.row]
        print(segue.identifier as Any )
        if(segue.identifier=="segue_cart"){
            if let myIndexPath = tabla.indexPathForSelectedRow {
                let selectedAlumno = alumnos[myIndexPath.row]
                let vista2 = segue.destination as! Vista2ViewController
                vista2.recibe = selectedAlumno.nombre
                vista2.recibeImagen = UIImage(named: selectedAlumno.imagenNombre)
                vista2.recibe_precio = selectedAlumno.precio
            }
        }
           
         

    }


}


//
//  TableOfDataViewController.swift
//  CRUDApplicationCoreData
//
//  Created by LARHCHIM ISMAIL on 6/13/21.
//  Copyright © 2021 LARHCHIM ISMAIL. All rights reserved.
//

import UIKit
import CoreData

class TableOfDataVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var array = [Personne]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableDataViewCell
        
        cell.dataEntry(name: array[indexPath.row].nom!, prenom: array[indexPath.row].prenom!, module: array[indexPath.row].module!, note:array[indexPath.row].note, image: UIImage(data:array[indexPath.row].image!)!)
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertVC = UIAlertController(title: "Modifier", message: "Modification des informations de l'etudiant \(array[indexPath.row].nom!) ", preferredStyle: .alert)
    
         alertVC.addTextField()
         alertVC.addTextField()
         alertVC.addTextField()
         alertVC.addTextField()
       
        var name = alertVC.textFields![0]
         var lastname = alertVC.textFields![1]
         var modulen = alertVC.textFields![2]
         var mark = alertVC.textFields![3]
        
        name.text = array[indexPath.row].nom
        lastname.text = array[indexPath.row].prenom
        modulen.text = array[indexPath.row].module
        mark.text = String(array[indexPath.row].note)
        
           
        alertVC.addAction(UIAlertAction(title: "save edit", style: .default, handler:
          { action -> Void in
            
            self.array[indexPath.row].nom = name.text
            self.array[indexPath.row].prenom = lastname.text
            self.array[indexPath.row].module = modulen.text
            self.array[indexPath.row].note = Float(String(mark.text!))!


              do {
                  try context.save()
              }catch{}
            
            self.tablev.reloadData()
          
          }))
        
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

      
     
        
        
     
        
      present(alertVC, animated: true, completion: nil)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let request:NSFetchRequest <Personne> = Personne.fetchRequest() 
        let contacts = try! context.fetch(request)
            
             for i in contacts {

                array.append(i)
                
             }
        

        
    }
    
    
    
    @IBOutlet weak var tablev: UITableView!
    
    @IBAction func editAction(_ sender: Any) {
        tablev.isEditing = !tablev.isEditing
        
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        array.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        /*self.etdimage.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        self.etdnote.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        self.etdmodule.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        self.etdprenom.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        self.etdnom.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        defaults.set(etdnom, forKey: "etdnom")
        defaults.set(etdprenom, forKey: "etdprenom")
        defaults.set(etdmodule, forKey: "etdmodule")
        defaults.set(etdimage,forKey: "etdimage")
        defaults.set(etdnote, forKey: "etdnote")*/
        
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            

            
            
            context.delete(self.array[indexPath.row])
            self.array.remove(at: indexPath.row)

                
                do {
                    try context.save()
                }catch{}
            /*self.etdimage.remove(at: indexPath.row)
            
            self.etdnote.remove(at: indexPath.row)
            
            self.etdmodule.remove(at: indexPath.row)
            
            self.etdprenom.remove(at: indexPath.row)
            
            self.etdnom.remove(at: indexPath.row)
            
            
            self.defaults.set(self.etdnom, forKey: "etdnom")
            self.defaults.set(self.etdprenom, forKey: "etdprenom")
            self.defaults.set(self.etdmodule, forKey: "etdmodule")
            self.defaults.set(self.etdimage,forKey: "etdimage")
            self.defaults.set(self.etdnote, forKey: "etdnote")*/
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            
            completionHandler(true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

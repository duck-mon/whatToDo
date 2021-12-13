//
//  TaskViewController.swift
//  whatToDo
//
//  Created by Perreras, Shae on 12/7/21.
//

import UIKit

class TaskViewController: UIViewController, UITextViewDelegate {

    //@IBOutlet var label: UILabel!
    
    @IBOutlet var details: UITextView!
    
    var task: String?
    var update: (()-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignBackground()
        //label.text = task
        details.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveDetails))
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit Title", style: .done, target: self, action: #selector(editTitle))
        
        // Loading data for details
        details.text = UserDefaults.standard.object(forKey: "details_\(task)") as? String

        // Do any additional setup after loading the view.
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        saveDetails()
        return true
    }
    
    @objc func saveDetails(){
        
        
        guard let text = details.text, !text.isEmpty else {
            return
        }
                
        
        UserDefaults().set(text, forKey: "details_\(task)")
        
        update?()
        navigationController?.popViewController(animated: true)
        

        
    }
    
    //@objc func editTitle(){
    //   let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        
    //  navigationController?.pushViewController(vc, animated: true)
    //}
    
    func assignBackground(){
            let background = UIImage(named: "background")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }
   


    //        let newCount = count - 1
    //
    //        UserDefaults().setValue(newCount, forKey: "count")
    //        UserDefaults.setValue(nil, forKey: "task_\(currentPosition)")

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

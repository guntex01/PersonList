//
//  CreatePersonViewController.swift
//  PersonList
//
//  Created by guntex01 on 5/22/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import Photos

class CreatePersonViewController: UIViewController {
    @IBOutlet weak var nameTexField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var passData: ((Person) -> ())?
    var imagePicker: UIImagePickerController!
    var manager: ManagerImagePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Tạo person"
        let saveButton = UIBarButtonItem(title: "save", style: .done, target: self, action: #selector(saveData))
        navigationItem.leftBarButtonItem = saveButton
        
        imagePicker = UIImagePickerController()
        manager = ManagerImagePicker(imagePicker, self)
        imagePicker.delegate = self
    }
    
    @objc func saveData() {
        guard let name = nameTexField.text, let phone = phoneTextField.text else {
            return
        }
        guard let avatar = photoImageView.image else {
            return
        }
        let person = Person(name: name, phone: phone, avatarImage: avatar)
        passData?(person)
        
        navigationController?.popViewController(animated: true)
    }
    
    

    @IBAction func onSelectPhoto(_ sender: Any) {
        let alert = UIAlertController(title: "App", message: "chọn từ ảnh", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "Máy ảnh", style: .default, handler: {(_) in
            print("chọn ảnh từ máy ảnh")
            self.manager.fromCamera()
        })
        let libray = UIAlertAction(title: "Thư viện", style: .default, handler: {(_) in
            print("chọn ảnh từ thư viện")
            self.manager.fromLibrary()
        })
        alert.addAction(camera)
        alert.addAction(libray)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    
}

extension CreatePersonViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
        }
    }





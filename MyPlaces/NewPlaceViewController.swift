//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Evgeny Syrtsov on 12/9/19.
//  Copyright © 2019 Evgeny Syrtsov. All rights reserved.
//

import UIKit

class NewPlaceViewController: UITableViewController {
    
    var imageIsChanged = false      //для отслеживания загрузил ли фото пользователь

    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var placeNameTextField: UITextField!
    @IBOutlet weak var placeTypeTextField: UITextField!
    @IBOutlet weak var placeLocationTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()  //скрываю ненужные разделители ячеек. пусть отображает только три задействованные ячейки
        saveButton.isEnabled = false          //пока юзер не введет название заведения, кнопка сохранить будет неактивна
        placeNameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
    }

    //MARK: Table view delegate
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {            //добавляю меню экшнЩит для добавления фотки (находится в ячейке 0)
            
            
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Сделать фото", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
            
            
            let photo = UIAlertAction(title: "Выбрать фото", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            
            
            let cancel = UIAlertAction(title: "Отмена", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
            
        } else {
            
            view.endEditing(true)      //скрываю клавиатуру если юзер нажал на любую ячейку кроме нулевой (там меню добавления фотки)
            
        }
    }
   
    func saveNewPlace() {                                   //заполняем структуру Плейс этим методом
        
        var image: UIImage?
        if imageIsChanged {                   //если пользователь не выбрал фотку, то подставляем заглушку свою
            image = placeImage.image
        } else {
            image = #imageLiteral(resourceName: "burguer")
        }
        
        let imageData = image?.pngData()
        
        let newPlace = Place(name: placeNameTextField.text!,
                             location: placeLocationTextField.text,
                             type: placeTypeTextField.text,
                             imageData: imageData)
        
        StorageManager.saveObject(newPlace)
    }
    @IBAction func cancelButtonAction(_ sender: Any) {            //скрываем вью
    
        dismiss(animated: true)
        
    }
    
}
 //MARK: Text field delegate

extension NewPlaceViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {       //скрываю клавиатуру при нажатии кнопки Готово
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {                              //отслеживаем заполнено ли поле с названием и вкл(выкл) кнопку Сохранить
        
        if placeNameTextField.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
        
    }
    
}

//MARK: Work with adding image for new place

extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true     //позволяем юзеру обрезать выбранную фотку так как ему надо
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        placeImage.image = info[.editedImage] as? UIImage     //вставляем обрезанную фотку пользователем во вью
        placeImage.contentMode = .scaleAspectFill             //выбираем режим отображения
        placeImage.clipsToBounds = true                      //отображаем только то что влезло во вью
        
        imageIsChanged = true
        
        dismiss(animated: true)                              //убираем имейджПикер
    }
    
}

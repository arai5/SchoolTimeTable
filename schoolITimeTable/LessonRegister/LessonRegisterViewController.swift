//
//  LessonRegisterViewController.swift
//  schoolITimeTable
//
//  Created by student on 2023/05/17.
//

import UIKit
import PhotosUI

protocol LessonRegisterDelegete: AnyObject {
    
    func close()
    
}

class LessonRegisterViewController: UIViewController {
    
    weak var delegete: LessonRegisterDelegete?

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var teacherTextField: UITextField!
    
    @IBOutlet weak var summaryTextView: UITextView!
    
    @IBOutlet var previewImageViews: [UIImageView]!
    
    @IBOutlet var clearButtons: [UIButton]!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var albumButton: UIButton!
    
    @IBOutlet weak var dayOfWeekSegment: UISegmentedControl!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func didTapedCloseButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapedCameraButton(_ sender: UIButton) {
        let pickerViewController = UIImagePickerController()
        pickerViewController.sourceType = .camera
       pickerViewController.delegate = self
        self.present(pickerViewController, animated: true)
    }
    
    @IBAction func didTapedAlbumButton(_ sender: UIButton) {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1

        let pickerView = PHPickerViewController(configuration: config)
        pickerView.delegate = self
        present(pickerView, animated: true)
    }
    
    @IBAction func didTapedRegisterButton(_ sender: UIButton) {
        let segment = dayOfWeekSegment.selectedSegmentIndex
        guard let title = titleTextField.text,
              let teacher = teacherTextField.text,
              let dayOfWeek = LessonListViewModel.DayOfWeek(rawValue: segment),
              !title.isEmpty,
              !teacher.isEmpty else {
                  return
              }
        let viewModel: LessonDetailViewModel = .init(
                title: title,
                teacher: teacher,
                images: images,
                summary: summaryTextView.text)
        TimeTableDataStore.shared.add(item: viewModel, dayOfWeek: dayOfWeek)
        delegete?.close()
        dismiss(animated: true)
    }
    
    
    @IBAction func didTapedClearButton(_ sender: UIButton) {
        clearPreviewImage(index: sender.tag)
    }
    
    var images: [UIImage] = [] {
        didSet {
            for index in 0..<previewImageViews.count {
                let imageView = previewImageViews[index]
                let clearButton = clearButtons[index]
                if images.indices.contains(index) {
                    let image = images[index]
                    imageView.image = image
                    clearButton.isHidden = false
            } else {
                imageView.image = nil
                clearButton.isHidden = true
            }
        }
            cameraButton.isEnabled = isCanImageAdd()
            albumButton.isEnabled = isCanImageAdd()
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summaryTextView.layer.borderWidth = 1.0
        summaryTextView.layer.borderColor = UIColor.lightGray.cgColor
        summaryTextView.layer.cornerRadius = 5.0
        registerButton.layer.borderWidth = 1.0
        registerButton.layer.borderColor = UIColor.lightGray.cgColor
        registerButton.layer.cornerRadius = 5.0
        
        for imageView in previewImageViews {
            imageView.layer.borderWidth = 1.0
            imageView.layer.borderColor = UIColor.lightGray.cgColor
            imageView.layer.cornerRadius = 5.0
        }
        
        images = []
       
        
        cameraButton.layer.borderWidth = 1.0
        cameraButton.layer.borderColor = UIColor.lightGray.cgColor
        cameraButton.layer.cornerRadius = 5.0
        
        albumButton.layer.borderWidth = 1.0
        albumButton.layer.borderColor = UIColor.lightGray.cgColor
        albumButton.layer.cornerRadius = 5.0
        //print("Life cycle - viewDidLoad")
    }
}
    
extension LessonRegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
    {
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
                                   [UIImagePickerController.InfoKey : Any]) {
            
            guard let image = info[.originalImage] as? UIImage else {
                return
            }
            setPreviewImage(image: image)
            picker.dismiss(animated: true)
        }
        
        func isCanImageAdd() -> Bool {
            return (images.count < 3)
    }

    func setPreviewImage(image: UIImage) {
        guard isCanImageAdd() else {
            return
        }
        images.append(image)
    }
    
    func clearPreviewImage(index: Int) {
        images.remove(at: index)
    }

}

extension LessonRegisterViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        guard let firstItem = results.first,
                       firstItem.itemProvider.canLoadObject(ofClass: UIImage.self) else {
            return
        }
        firstItem.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { image, error in
            guard let image = image as? UIImage else {
                return
            }
            DispatchQueue.main.async {
            self.setPreviewImage(image: image)
            }
        })
    }
}
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("Life cycle - viewWillAppear")
//    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        print("Life cycle - viewWillLayoutSubviews")
//    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        print("Life cycle - viewDidLayoutSubviews")
//    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("Life cycle - viewDidAppear")
//    }

//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("Life cycle - viewWillDisappear")
//    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//      super.viewDidDisappear(animated)
//        print("Life cycle - viewDidDisappear")
//    }


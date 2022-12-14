//
//  AddCaregiverViewController.swift
//  Odev2
//
//  Created by Yeliz Akkaya on 18.11.2022.
//

import UIKit

final class AddCaregiverViewController: UIViewController {

    @IBOutlet private weak var caregiverInfoLabel: UILabel!
    @IBOutlet private weak var caregiverNameText: UITextField!
    @IBOutlet private weak var caregiverExperianceText: UITextField!
    @IBOutlet private weak var salaryLabel: UILabel!
    
    
    var zoo: Zoo?
    var caregiver: Caregiver?
    var caregiverName: String = ""
    var caregiverExperience: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        caregiverNameText.text = ""
        caregiverExperianceText.text = String()
        caregiverInfoLabel.text = "ADD CAREGIVER"
    }
    
    @IBAction private func addCaregiverButton(_ sender: Any) {
        if let name = caregiverNameText?.text {
            caregiverName = name
        }
        if let experience = Int((caregiverExperianceText?.text)!) {
            caregiverExperience = experience
        }
        
        if caregiverName == "" || caregiverExperience <= 0 {
            makeAlert(titleInput: "Incorrect Entry", messageInput: "You can enter name or experience.")
        } else {
            caregiver = Caregiver(name: caregiverName, experience: caregiverExperience)
            zoo?.addCaregiver(caregiver: caregiver!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction private func salaryCalculation(_ sender: Any) {
        if let name = caregiverNameText?.text {
            caregiverName = name
        }
        if let experience = Int((caregiverExperianceText?.text)!) {
            caregiverExperience = experience
        }
        
        if caregiverName == "" || caregiverExperience <= 0 {
            makeAlert(titleInput: "Incorrect Entry", messageInput: "You can enter name or experience.")
        } else {
            caregiver = Caregiver(name: caregiverName, experience: caregiverExperience)
            salaryLabel.text = "Salary: \(caregiver!.salary)"
        }
    }
    
    
    func makeAlert(titleInput: String, messageInput:String)  {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

//Caregiver s??n??f??n??n protocol??n?? tan??mlad??m.
protocol CaregiverInfo {
    var name: String { get }
    var animals: [any AnimalsInfo]? { get }
    var salary: Int { get }
    var experiance: Int { get }
}

//Caregiver s??n??f??n?? tan??mlad??m.
class Caregiver: CaregiverInfo {
    var name: String
    var animals: [any AnimalsInfo]? //Eklenecek olan hayvan AnimalsInfo protocol??ne uymas?? gerekiyor.
    var experiance: Int
    var salary: Int { experiance * 100 } //Bak??c??n??n maa?? ??demesinin nas??l yap??laca????n?? tan??ml??yorum.
    
    //animals array'i i??erisinde gelen ve careGiver'?? olmayan hayvanlara bak??c?? da bu k??s??mda atan??yor.
    init(name:String , experience: Int){
        self.name = name
        self.experiance = experience
        self.animals = []
    }
}
